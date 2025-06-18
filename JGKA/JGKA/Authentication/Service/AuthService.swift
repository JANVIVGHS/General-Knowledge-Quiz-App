import Firebase
import FirebaseFirestoreSwift

class AuthService: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isRegistrationSuccessful = false
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await userService.shared.fetchCurrentUser()  // ✅ Ensure `UserService.shared` exists
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
            throw error
        }
    }
    
    /// ✅ **Updated createUser() function (No Completion Handler)**
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, username: String) async throws {
        // ✅ 1️⃣ Check if username exists
        let usernameExists = try await checkIfUsernameExists(username)
        if usernameExists {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Username is already taken. Please choose another."])
        }
        
        // ✅ 2️⃣ Create Firebase user
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user

        // ✅ 3️⃣ Upload user data to Firestore
        try await uploadUserData(withEmail: email, fullname: fullName, username: username, id: result.user.uid)
        
        // ✅ 4️⃣ Fetch current user
        try await userService.shared.fetchCurrentUser()
    }

    /// ✅ Check if the username already exists
    private func checkIfUsernameExists(_ username: String) async throws -> Bool {
        let querySnapshot = try await Firestore.firestore()
            .collection("users")
            .whereField("username", isEqualTo: username)
            .getDocuments()
        
        return !querySnapshot.documents.isEmpty
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        userService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        userService.shared.currentUser = user
    }
}

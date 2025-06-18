import Foundation

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    // Save user data to UserDefaults
    func saveUserData(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: "currentUser")
        }
    }
    
    // Load user data from UserDefaults
    func loadUserData() -> User? {
        if let savedUserData = UserDefaults.standard.object(forKey: "currentUser") as? Data {
            let decoder = JSONDecoder()
            if let decodedUser = try? decoder.decode(User.self, from: savedUserData) {
                return decodedUser
            }
        }
        return nil
    }
    
    // Remove user data from UserDefaults (e.g., for logout)
    func removeUserData() {
        UserDefaults.standard.removeObject(forKey: "currentUser")
    }
}

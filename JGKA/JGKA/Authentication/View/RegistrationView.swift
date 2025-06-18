import SwiftUI
import Firebase
import FirebaseFirestore

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var errorMessage: String?
    @State private var registrationSuccessful = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                Group {
                    TextField("Full Name", text: $fullname)
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                    SecureField("Confirm Password", text: $confirmPassword)
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: registerUser) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                NavigationLink(destination: QuizView(), isActive: $registrationSuccessful) {
                    EmptyView()
                }
            }
            .padding()
        }
    }

    private func registerUser() {
        guard !fullname.isEmpty, !username.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }

            guard let userId = result?.user.uid else { return }

            let user = User(
                id: userId,
                fullname: fullname,
                email: email,
                username: username,
                profileImageUrl: nil,
                bio: nil
            )

            let db = Firestore.firestore()
            do {
                try db.collection("users").document(userId).setData(from: user)
                self.registrationSuccessful = true
            } catch {
                self.errorMessage = "Failed to save user data: \(error.localizedDescription)"
            }
        }
    }
}

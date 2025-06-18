import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var isRegistrationSuccessful = false
    @Published var registrationError: String?
    @Published var username = ""
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""

    init() {
        print("RegistrationViewModel initialized")
    }

    func createUser() {
        Task {
            do {
                try await AuthService.shared.createUser(
                    withEmail: email,
                    password: password,
                    fullName: fullname,
                    username: username
                )
                
                DispatchQueue.main.async {
                    self.isRegistrationSuccessful = true
                }

            } catch {
                print("Error creating user: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.registrationError = error.localizedDescription
                }
            }
        }
    }
}

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.mint.opacity(0.4)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.orange)

                    Text("Create Account")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(.orange)
                        .shadow(radius: 1)
                        .padding(.bottom, 10)

                    VStack(spacing: 16) {
                        TextField("Username", text: $viewModel.username)
                            .textFieldStyle()

                        TextField("Full Name", text: $viewModel.fullname)
                            .textFieldStyle()

                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .textFieldStyle()

                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle()

                        if let error = viewModel.registrationError {
                            Text(error)
                                .font(.footnote)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        Button("Sign Up") {
                            Task {
                                await viewModel.createUser()

                                // Check if registration was successful
                                if viewModel.isRegistrationSuccessful {
                                    navigateToLogin = true // Trigger navigation to login
                                }
                            }
                        }
                        .fontWeight(.bold)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            LinearGradient(
                                colors: [Color.blue, Color.indigo],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .shadow(radius: 3)
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(25)
                    .shadow(radius: 4)
                    .padding(.horizontal)

                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.black)
                        NavigationLink("Sign In", destination: LoginView())
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .opacity(navigateToLogin ? 0 : 1) // Hide the "Sign In" button if navigateToLogin is triggered
                    }
                    .padding(.top, 10)

                    Spacer()
                }
                .padding()

                // Invisible NavigationLink triggered by registration
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $navigateToLogin) {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - Custom TextField Style

extension View {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orange.opacity(0.5), lineWidth: 1))
            .shadow(radius: 1)
    }
}

// MARK: - Preview

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

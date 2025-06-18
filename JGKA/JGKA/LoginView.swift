import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @State private var showQuizView = false
    @State private var loginSuccessAlert = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.3), Color.cyan.opacity(0.4)]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purple)
                    
                    Text("Welcome Back!")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(.purple)
                        .shadow(radius: 1)
                    
                    VStack(spacing: 16) {
                        CustomTextField(placeholder: "Email", text: $viewModel.email)
                        CustomSecureField(placeholder: "Password", text: $viewModel.password)
                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .font(.footnote)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Button {
                            Task {
                                if !isValidEmail(viewModel.email) {
                                    errorMessage = "Invalid email format"
                                    return
                                }
                                
                                do {
                                    try await viewModel.login()
                                    loginSuccessAlert = true
                                    errorMessage = ""
                                } catch {
                                    errorMessage = "Email or password is incorrect"
                                }
                            }
                        } label: {
                            Text("Log In")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(LinearGradient(colors: [Color.blue, Color.indigo], startPoint: .leading, endPoint: .trailing))
                                .foregroundColor(.white)
                                .cornerRadius(14)
                                .shadow(radius: 3)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(25)
                    .shadow(radius: 4)
                    .padding(.horizontal)
                    

                    
                    HStack {
                        Text("Click here to register : ")
                            .foregroundColor(.black)
                        NavigationLink {
                            RegisterView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
            .alert("Login Successful", isPresented: $loginSuccessAlert) {
                Button("OK") {
                    showQuizView = true
                }
            }
            .fullScreenCover(isPresented: $showQuizView) {
                QuizView()
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailFormat).evaluate(with: email)
    }
}

// MARK: - Custom Reusable Fields

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.purple.opacity(0.5), lineWidth: 1))
            .shadow(radius: 1)
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    @State private var isSecure: Bool = true

    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .autocapitalization(.none)
            .disableAutocorrection(true)
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.purple.opacity(0.5), lineWidth: 1))
        .shadow(radius: 1)
    }
}

// MARK: - Preview

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

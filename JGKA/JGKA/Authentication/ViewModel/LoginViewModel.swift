//
//  LoginViewModel.swift
//  Project_recepie_app
//
//  Created by BMIIT on 17/03/25.
//

import Foundation
class LoginViewModel: ObservableObject {
    

    @Published var email = ""
    @Published var password = ""
    
    
    
    @MainActor
    func login() async throws {
       try await AuthService.shared.login(withEmail: email,password: password)
    }
}

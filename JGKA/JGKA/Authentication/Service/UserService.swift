//
//  UserService.swift
//  Project_recepie_app
//
//  Created by BMIIT on 19/03/25.
//


import Firebase
import FirebaseFirestoreSwift

class userService {
    @Published var currentUser: User?
    
    static let shared = userService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            guard let data = snapshot.data() else {
                print("DEBUG: No user data found in Firestore.")
                return
            }
            
            let user = try? Firestore.Decoder().decode(User.self, from: data)
            DispatchQueue.main.async {
                self.currentUser = user
            }
            
            print("DEBUG: Fetched user from Firestore: \(self.currentUser?.fullname ?? "Unknown")")
        }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentuid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = try snapshot.documents.compactMap({ try? $0.data(as: User.self)})
        return users.filter({$0.id != currentuid})
        
        
    }
    
    func reset() {
        self.currentUser = nil
    }
}

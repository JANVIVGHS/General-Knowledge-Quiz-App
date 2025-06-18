import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String? //optional to have a user profile
    var bio: String? //also optional
    
}

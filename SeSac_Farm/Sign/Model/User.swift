//
//  User.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import Foundation


//// MARK: - User
//struct User: Codable {
//    let jwt: String
//    let user: UserClass
//}
//
//// MARK: - UserClass
//struct UserClass: Codable {
//    let id: Int
//    let username, email: String
//
//}


// MARK: - User
struct User: Codable {
    let jwt: String
    let user: UserClass
}

// MARK: - UserClass
struct UserClass: Codable {
    let id: Int
    let username, email, provider: String
    let confirmed: Bool
    let role: Role
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, username, email, provider, confirmed, role
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Role
struct Role: Codable {
    let id: Int
    let name, roleDescription, type: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roleDescription = "description"
        case type
    }
}

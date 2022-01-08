//
//  Comments.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/07.
//

import Foundation


// MARK: - Comment
struct Comment: Codable {
    let id: Int
    let comment: String
    let user: UserComent
    let post: PostComent?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, comment, user, post
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Post
struct PostComent: Codable {
    let id: Int?
    let text: String?
    let user: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct UserComent: Codable {
    let id: Int
    let username, email: String
    let provider: ProviderComent
    let confirmed: Bool
    let blocked: Bool?
    let role: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, username, email, provider, confirmed, blocked, role
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum ProviderComent: String, Codable {
    case local = "local"
}

typealias Comments = [Comment]

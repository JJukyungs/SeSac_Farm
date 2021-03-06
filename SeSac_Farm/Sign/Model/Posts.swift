//
//  Posts.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let id: Int
    let text: String
    let user: UserPosts
    let createdAt, updatedAt: String
    let comments: [CommentPost]

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case comments
    }
}

// MARK: - Comment
struct CommentPost: Codable {
    let id: Int
    let comment: String
    let user, post: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, comment, user, post
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct UserPosts: Codable {
    let id: Int
    let username, email: String
    let provider: Provider
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

enum Provider: String, Codable {
    case local = "local"
}

typealias Posts = [Post]

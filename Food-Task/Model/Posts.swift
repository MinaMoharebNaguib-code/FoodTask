//
//  Posts.swift
//  Food-Task
//
//  Created by Mina Mohareb on 27/03/2023.
//

import Foundation

// MARK: - Posts
class Posts: Codable {
    let posts: [Post]
    let total, skip, limit: Int

    init(posts: [Post], total: Int, skip: Int, limit: Int) {
        self.posts = posts
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}

// MARK: - Post
struct Post: Codable, Hashable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}

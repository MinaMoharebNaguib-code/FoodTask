//
//  User.swift
//  Food-Task
//
//  Created by Mina Mohareb on 27/03/2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let users = try? JSONDecoder().decode(Users.self, from: jsonData)

import Foundation

// MARK: - Users
class Users: Codable {
    let users: [User]
    let total, skip, limit: Int

    init(users: [User], total: Int, skip: Int, limit: Int) {
        self.users = users
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName, lastName, maidenName: String
    let email, phone, username, password: String
    let image: String
}

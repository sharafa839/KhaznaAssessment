//
//  PostEntity.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

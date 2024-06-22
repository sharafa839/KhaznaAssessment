//
//  PostEntity.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/2024.
//

import Foundation

// MARK: - Post
internal struct PostResponse: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

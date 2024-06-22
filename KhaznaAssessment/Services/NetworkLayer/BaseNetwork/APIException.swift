//
//  APIException.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/2024.
//

import Foundation

struct ApiError: LocalizedError {
    var status: Int
    var message: String
    
    var errorDescription: String? { message }
}

extension ApiError {
    
    static let somethingWrong = ApiError(status: 0, message: "somethingWentWrongTryAgainLater")
}

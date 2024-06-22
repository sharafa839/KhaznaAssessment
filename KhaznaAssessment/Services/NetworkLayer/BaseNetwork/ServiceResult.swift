//
//  ServiceResult.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/2024.
//

enum RequestResult<T> {
    
    case success(T)
    case failure(ApiError)
}

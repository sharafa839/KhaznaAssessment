//
//  PostApi.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/2024.
//

import Foundation
import Alamofire

enum PostApi {
    
    case getPosts(page: Int)
}

extension PostApi: TargetType{
    
    var baseURL: String {
        switch self {
            
        default:
            return "https://jsonplaceholder.typicode.com"
        }
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "/posts"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
            
        }
    }
    
    var task: Task {
        switch self {
        case .getPosts(let page):
            return .requestParameters(parameters: ["_page": "\(page)"], encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}

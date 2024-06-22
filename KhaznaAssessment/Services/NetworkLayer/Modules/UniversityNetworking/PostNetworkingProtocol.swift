//
//  PostNetworkingProtocol.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/2024.
//

import Foundation

protocol PostNetworkingProtocol {
    
    func getPosts(page: Int, completion : @escaping(RequestResult<[PostResponse]>)->Void)
}


extension PostNetworkingProtocol  {
    
    private var repo: PostRepo {
        return PostRepo()
    }
    
    func getPosts(page: Int, completion : @escaping(RequestResult<[PostResponse]>)->Void) {
        repo.fetchData(target: .getPosts(page: page), completion: completion)
    }
}

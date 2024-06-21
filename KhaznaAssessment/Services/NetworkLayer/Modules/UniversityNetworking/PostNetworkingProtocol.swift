//
//  UniversityNetworking.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/2024.
//

import Foundation

protocol UniversityNetworkingProtocol {
    
    func getUniversities(completion : @escaping(RequestResult<[PostResponse]>)->Void)
}


extension UniversityNetworkingProtocol  {
    
    private var repo: UniversityRepo {
        return UniversityRepo()
    }
    
    func getUniversities(completion : @escaping(RequestResult<[PostResponse]>)->Void) {
        repo.fetchData(target: .getUniversities, completion: completion)
    }
}

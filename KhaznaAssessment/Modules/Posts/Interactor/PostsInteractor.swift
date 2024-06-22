//
//  PostsInteractor.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//  
//

import Foundation
import RealmSwift

internal final class PostsInteractor: PresenterToInteractorPostsProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterPostsProtocol?
    private var repo: PostNetworkingProtocol
    
    //MARK: - Init
    init(repo: PostNetworkingProtocol = PostRepo()) {
        self.repo = repo
    }
    
    //MARK: - Methods
    
    func fetchPosts(currentPage: Int) {
        let preFetchPosts = getPostsFromRealm()
        presenter?.fetchPostsSuccessfully(posts: preFetchPosts)
        repo.getPosts(page: currentPage) { [weak self] value  in
            guard let self  else { return }
            switch value {
            case .success(let data):
                let posts = data.compactMap({Post(model: $0)})
                savePostsInRealm(posts) { [weak self] in                   
                    self?.presenter?.fetchPostsSuccessfully(posts: posts)
                }
            case .failure(let apiError):
                presenter?.showErrorMessage(apiError.localizedDescription)
                let posts: [Post] = getPostsFromRealm()
                presenter?.fetchPostsSuccessfully(posts: posts)
            }
        }
    }
    
    func getPostsFromRealm() -> [Post] {
        let repository = RealmService<PostRealm>()
        return repository.fetchAll()
    }
    
    func savePostsInRealm(_ posts: [Post], completion: @escaping () -> Void) {
        do {
            let repository = RealmService<PostRealm>()
            try repository.deleteAll()
            try repository.save(items: posts)
            completion()
        } catch let error {
            print(error.localizedDescription)
            completion()
        }
    }
}

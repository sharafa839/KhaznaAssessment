//
//  PostsPresenter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//  
//

import Foundation
import UIKit

class PostsPresenter: ViewToPresenterPostsProtocol {
    
    // MARK: Properties
    
    weak var view: PresenterToViewPostsProtocol?
    var interactor: PresenterToInteractorPostsProtocol?
    var router: PresenterToRouterPostsProtocol?
    var posts: [Post] = []
    var currentPage: Int = 1
    var postsCount: Int {
        posts.count
    }
    
    //MARK: - Methods
   
    func showPostController(navigationController: UINavigationController) {
       // router.
    }
    
    func scrollToEnd(indexPath: IndexPath) {
           if indexPath.row == postsCount - 1 { // last cell
             currentPage += 1
               interactor?.fetchPosts(currentPage: currentPage)
           }
    }
}

extension PostsPresenter: InteractorToPresenterPostsProtocol {
    func fetchPostsSuccessfully(posts: [Post]) {
        self.posts += posts
        view?.reloadDate()
    }
    
    func showErrorMessage(_ errorMessage: String) {
        view?.showErrorMessage(errorMessage)
    }
    
    func viewDidLoad() {
        interactor?.fetchPosts(currentPage: currentPage)
    }
    
    func post(atIndex indexPath: IndexPath) -> Post? {
        if posts.indices.contains(indexPath.row) {
            return posts[indexPath.row]
        } else {
            return nil
        }
    }
}

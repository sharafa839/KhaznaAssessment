//
//  PostsPresenter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//  
//

import Foundation
import UIKit

internal final class PostsPresenter: ViewToPresenterPostsProtocol {
    
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

    func scrollToEnd(indexPath: IndexPath) {
           if indexPath.row == postsCount - 1 { // last cell
             currentPage += 1
               interactor?.fetchPosts(currentPage: currentPage)
           }
    }
    
    func viewDidLoad() {
        view?.showActivityIndicator()
        interactor?.fetchPosts(currentPage: currentPage)
    }
    
    
    func navigateToPost(atIndex indexPath: IndexPath, navigationController: UINavigationController) {
        if posts.indices.contains(indexPath.row) {
            let post =  posts[indexPath.row]
            router?.navigateToPostDetailsViewController(post: post, navigationController: navigationController)
        }
    }
}

extension PostsPresenter: InteractorToPresenterPostsProtocol {
    func fetchPostsSuccessfully(posts: [Post]) {
        self.posts += posts
        view?.reloadDate()
        view?.hideActivityIndicator()
    }
    
    func showErrorMessage(_ errorMessage: String) {
        view?.showErrorMessage(errorMessage)
    }
}

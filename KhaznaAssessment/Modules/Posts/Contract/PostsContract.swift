//
//  PostsContract.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPostsProtocol: AnyObject {
    func reloadDate()
    func showErrorMessage(_ errorMessage: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPostsProtocol {
    
    var view: PresenterToViewPostsProtocol? { get set }
    var interactor: PresenterToInteractorPostsProtocol? { get set }
    var router: PresenterToRouterPostsProtocol? { get set }
    var postsCount: Int { get }
    var posts: [Post] { get set }
    var currentPage: Int { get set }
    func viewDidLoad()
    func scrollToEnd(indexPath: IndexPath)
    func navigateToPost(atIndex indexPath: IndexPath, navigationController: UINavigationController)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPostsProtocol {
    
    var presenter: InteractorToPresenterPostsProtocol? { get set }
    func fetchPosts(currentPage: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPostsProtocol {
    
    func fetchPostsSuccessfully(posts: [Post])
    func showErrorMessage(_ errorMessage: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPostsProtocol {
    
    func navigateToPostDetailsViewController(post: Post, navigationController: UINavigationController)
}

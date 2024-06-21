//
//  PostsRouter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//  
//

import Foundation
import UIKit

class PostsRouter: PresenterToRouterPostsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PostsViewController()
        
        let presenter: ViewToPresenterPostsProtocol & InteractorToPresenterPostsProtocol = PostsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PostsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PostsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

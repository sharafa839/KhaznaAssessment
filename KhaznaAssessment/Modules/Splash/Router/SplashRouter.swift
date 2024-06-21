//
//  SplashRouter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation
import UIKit

class SplashRouter: PresenterToRouterSplashProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SplashViewController()
        
        let presenter: ViewToPresenterSplashProtocol & InteractorToPresenterSplashProtocol = SplashPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SplashRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SplashInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func setPostsViewControllerAsRoot() {
        let postsViewController = PostsRouter.createModule()
        let navigationViewController = UINavigationController(rootViewController: postsViewController)
        AppUtilities.changeRoot(root: navigationViewController, animated: true)
    }
    
}

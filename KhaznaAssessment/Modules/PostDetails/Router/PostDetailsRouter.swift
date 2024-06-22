//
//  PostDetailsRouter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation
import UIKit

internal final class PostDetailsRouter: PresenterToRouterPostDetailsProtocol {
    
    // MARK: Static methods
    static func createModule(post: Post) -> UIViewController {
        
        let viewController = PostDetailsViewController()
        
        let presenter: ViewToPresenterPostDetailsProtocol & InteractorToPresenterPostDetailsProtocol = PostDetailsPresenter(post: post)
        
        viewController.presenter = presenter
        viewController.presenter?.router = PostDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PostDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

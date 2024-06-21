//
//  PostDetailsRouter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation
import UIKit

class PostDetailsRouter: PresenterToRouterPostDetailsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PostDetailsViewController()
        
        let presenter: ViewToPresenterPostDetailsProtocol & InteractorToPresenterPostDetailsProtocol = PostDetailsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PostDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PostDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

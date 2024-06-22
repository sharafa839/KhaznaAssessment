//
//  SplashPresenter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation

internal final class SplashPresenter: ViewToPresenterSplashProtocol {
  
    

    // MARK: Properties
    var view: PresenterToViewSplashProtocol?
    var interactor: PresenterToInteractorSplashProtocol?
    var router: PresenterToRouterSplashProtocol?
    
    func setPostsViewControllerAsRoot() {
        router?.setPostsViewControllerAsRoot()
    }
}

extension SplashPresenter: InteractorToPresenterSplashProtocol {
    
}

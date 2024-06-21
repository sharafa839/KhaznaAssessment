//
//  SplashContract.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSplashProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSplashProtocol {
    
    var view: PresenterToViewSplashProtocol? { get set }
    var interactor: PresenterToInteractorSplashProtocol? { get set }
    var router: PresenterToRouterSplashProtocol? { get set }
    
    func setPostsViewControllerAsRoot()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSplashProtocol {
    
    var presenter: InteractorToPresenterSplashProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSplashProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSplashProtocol {
    func setPostsViewControllerAsRoot()
}

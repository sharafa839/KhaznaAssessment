//
//  SplashContract.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSplashProtocol: AnyObject {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSplashProtocol: AnyObject {
    
    var view: PresenterToViewSplashProtocol? { get set }
    var interactor: PresenterToInteractorSplashProtocol? { get set }
    var router: PresenterToRouterSplashProtocol? { get set }
    
    func setPostsViewControllerAsRoot()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSplashProtocol: AnyObject {
    
    var presenter: InteractorToPresenterSplashProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSplashProtocol: AnyObject {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSplashProtocol: AnyObject {
    func setPostsViewControllerAsRoot()
}

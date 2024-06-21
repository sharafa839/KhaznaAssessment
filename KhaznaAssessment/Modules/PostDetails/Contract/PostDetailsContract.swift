//
//  PostDetailsContract.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPostDetailsProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPostDetailsProtocol {
    
    var view: PresenterToViewPostDetailsProtocol? { get set }
    var interactor: PresenterToInteractorPostDetailsProtocol? { get set }
    var router: PresenterToRouterPostDetailsProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPostDetailsProtocol {
    
    var presenter: InteractorToPresenterPostDetailsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPostDetailsProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPostDetailsProtocol {
    
}

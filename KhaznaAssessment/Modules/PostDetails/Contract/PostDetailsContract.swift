//
//  PostDetailsContract.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPostDetailsProtocol: AnyObject {
    var presenter: ViewToPresenterPostDetailsProtocol? { get set }
    func showPostDetails(post: Post)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPostDetailsProtocol: AnyObject {
    
    var view: PresenterToViewPostDetailsProtocol? { get set }
    var interactor: PresenterToInteractorPostDetailsProtocol? { get set }
    var router: PresenterToRouterPostDetailsProtocol? { get set }
    func viewDidLoad()
    var post: Post { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPostDetailsProtocol: AnyObject {
    
    var presenter: InteractorToPresenterPostDetailsProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPostDetailsProtocol: AnyObject {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPostDetailsProtocol {
    
}

//
//  PostDetailsPresenter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation

class PostDetailsPresenter: ViewToPresenterPostDetailsProtocol {

    // MARK: Properties
    var view: PresenterToViewPostDetailsProtocol?
    var interactor: PresenterToInteractorPostDetailsProtocol?
    var router: PresenterToRouterPostDetailsProtocol?
}

extension PostDetailsPresenter: InteractorToPresenterPostDetailsProtocol {
    
}

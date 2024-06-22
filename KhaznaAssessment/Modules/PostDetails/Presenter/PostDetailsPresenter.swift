//
//  PostDetailsPresenter.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import Foundation

internal final class PostDetailsPresenter: ViewToPresenterPostDetailsProtocol {

    // MARK: Properties
    var view: PresenterToViewPostDetailsProtocol?
    var interactor: PresenterToInteractorPostDetailsProtocol?
    var router: PresenterToRouterPostDetailsProtocol?
    var post: Post
    init(post: Post) {
        self.post = post
    }
    
    func viewDidLoad() {
        view?.showPostDetails(post: post)
    }
}

extension PostDetailsPresenter: InteractorToPresenterPostDetailsProtocol {
    
}

//
//  PostDetailsViewController.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterPostDetailsProtocol?
    
}

extension PostDetailsViewController: PresenterToViewPostDetailsProtocol{
    // TODO: Implement View Output Methods
}

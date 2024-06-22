//
//  PostDetailsViewController.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import UIKit

internal final class PostDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var postTitleLabel: UILabel!
    @IBOutlet weak private var postBodyLabel: UILabel!
    @IBOutlet weak private var favoriteButton: UIButton!
    
    //MARK: - Properties
    
    var presenter: ViewToPresenterPostDetailsProtocol?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    //MARK: - Actions
    
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        presenter?.post.isFavorited.toggle()
        favoriteButton.setImage(presenter?.post.isFavorited ?? false ? UIImage(systemName: "heart.fill")?.withTintColor(.red) : UIImage(systemName: "heart"), for: .normal)
    }
}

extension PostDetailsViewController: PresenterToViewPostDetailsProtocol {

    func showPostDetails(post: Post) {
        postTitleLabel.text = post.title
        postBodyLabel.text = post.body
        favoriteButton.setImage(post.isFavorited ? UIImage(systemName: "heart.fill")?.withTintColor(.red) : UIImage(systemName: "heart"), for: .normal)
    }
}

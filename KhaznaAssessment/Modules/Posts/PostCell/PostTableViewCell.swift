//
//  PostTableViewCell.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//

import UIKit

internal final class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func configure(_ post: Post) {
        postTitleLabel.text = post.title
        postDescriptionLabel.text = post.body
        heartImageView.image = post.isFavorited ? UIImage(systemName: "heart.fill")?.withTintColor(.red) : UIImage(systemName: "heart")
    }
    
}

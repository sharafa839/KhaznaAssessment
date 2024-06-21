//
//  SplashViewController.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 110))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    var presenter: ViewToPresenterSplashProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImageView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.presenter?.setPostsViewControllerAsRoot()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.animate()
        }
    }

    private func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let xpostion = size - self.view.frame.width
            let ypostion = self.view.frame.height - size
            self.logoImageView.frame = CGRect(x: -(xpostion/2), y: ypostion/2, width: size, height: size)
            self.logoImageView.alpha = 0
        }
    }
    
    //MARK: - Methods
}

extension SplashViewController: PresenterToViewSplashProtocol{
    // TODO: Implement View Output Methods
}

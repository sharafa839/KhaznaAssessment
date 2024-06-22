//
//  SplashViewController.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/21/24.
//  
//

import UIKit

internal final class SplashViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 100))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    var presenter: ViewToPresenterSplashProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNewRoot()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupAnimation()
    }

    
    //MARK: - Methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
    }
    
    private func setNewRoot() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) { [weak self] in
            self?.presenter?.setPostsViewControllerAsRoot()
        }
    }
    
    private func setupAnimation() {
        logoImageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.animate()
        }
    }
    
    private func animate() {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            let size = view.frame.size.width  * 2
            let xpostion = size - view.frame.width
            let ypostion = view.frame.height - size
            logoImageView.frame = CGRect(x: -(xpostion/2), y: ypostion/2, width: size, height: size)
            logoImageView.alpha = 0
        }
    }
}

extension SplashViewController: PresenterToViewSplashProtocol{
    // TODO: Implement View Output Methods
}

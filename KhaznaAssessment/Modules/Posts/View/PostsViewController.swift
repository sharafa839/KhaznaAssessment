//
//  PostsViewController.swift
//  KhaznaAssessment
//
//  Created by Sharaf on 6/20/24.
//  
//

import UIKit

internal final class PostsViewController: UIViewController {
    
    // MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties -
    
    private let refreshControl = UIRefreshControl()

    // MARK: - IBOutlets -
    var presenter: ViewToPresenterPostsProtocol?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableViewAndRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        // reload table view so redraw cell after back from post details if you favorite the post
        // not make it delegate and depends on class reference type because it's more easy and quick
    }
    
    // MARK: - Methods

    private func setupTableViewAndRefreshControl() {
        tableView.register(nib: PostTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor.yellow
        refreshControl.addTarget(self, action: #selector(refreshPostList(_:)), for: .valueChanged)
    }
    
    @objc private func refreshPostList(_ sender: Any) {
        presenter?.posts = []
        presenter?.viewDidLoad()
    }
}

extension PostsViewController: PresenterToViewPostsProtocol {
    
    // TODO: Implement View Output Methods
    func reloadDate() {
        tableView.reloadData()
        refreshControl.endRefreshing()
        hideActivityIndicator()
    }
    
    func showErrorMessage(_ errorMessage: String) {
        hideActivityIndicator()
        refreshControl.endRefreshing()
        let alertController: UIAlertController = UIAlertController(title: "error", message: errorMessage, preferredStyle: .alert)
               let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alertController.addAction(okAction)
               present(alertController, animated: true, completion: nil)
    }
}

extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.postsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeue()
        guard let post = presenter?.posts[indexPath.row] else { return UITableViewCell() }
        presenter?.scrollToEnd(indexPath: indexPath)
        cell.configure(post)
        return cell
    }
    
    // we can do it by did scroll delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToPost(atIndex: indexPath, navigationController: navigationController!)
    }
}

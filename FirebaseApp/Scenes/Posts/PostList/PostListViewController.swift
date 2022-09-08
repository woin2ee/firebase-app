//
//  PostListViewController.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/08/28.
//

import UIKit
import FirebaseDatabase

final class PostListViewController: UIViewController, Instantiatable {
    
    private let dataBaseRepository = FirebaseDatabaseRepository.init()
    private var handles: Set<UInt> = .init()
    
    @IBOutlet private weak var postListTableView: UITableView! {
        didSet {
            postListTableView.dataSource = self
            postListTableView.delegate = self
        }
    }
    
    private var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        
        self.handles.insert(
            self.dataBaseRepository.observePosts(with: { snapshot in
                guard let postsDict = snapshot.value as? [String : [String : String]] else { return }

                let posts = postsDict.compactMap { key, value -> Post? in
                    guard
                        let uuid = value["uuid"],
                        let title = value["title"]
                    else { return nil }
                    return .init(uuid: uuid, title: title)
                }
                
                self.posts = posts
                self.postListTableView.reloadData()
            })
        )
    }
    
    private func configureNavigationBar() {
        let addButton: UIBarButtonItem = {
            let button = UIBarButtonItem.init(systemItem: .add)
            button.primaryAction = .init(handler: { _ in
                self.didTapPostRegisterButton()
            })
            return button
        }()
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    private func didTapPostRegisterButton() {
        let postRegistrationAlert = RegistrationAlertController.init(
            title: "게시물 등록",
            message: "제목을 입력해주세요."
        )
        postRegistrationAlert.addConfirmAction { _ in
            let postTitle = postRegistrationAlert.textFields?.first?.text ?? ""
            self.dataBaseRepository.savePost(title: postTitle)
        }
        
        self.present(postRegistrationAlert, animated: true)
    }
}

// MARK: - UITableView DataSource & Delegate

extension PostListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "")
        
        var config = cell.defaultContentConfiguration()
        config.text = self.posts[indexPath.row].title
        cell.contentConfiguration = config
        
        return cell
    }
}

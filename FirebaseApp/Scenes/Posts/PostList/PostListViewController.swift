//
//  PostListViewController.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/08/28.
//

import UIKit

final class PostListViewController: UIViewController, Instantiatable {
    
    let dataBaseRepository = FirebaseDatabaseRepository.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
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

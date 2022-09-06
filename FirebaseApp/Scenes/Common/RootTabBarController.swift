//
//  RootTabBarController.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/09/06.
//

import UIKit

final class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureAppearance()
        self.configureBarItems()
    }
    
    private func configureAppearance() {
        self.tabBar.backgroundColor = .systemGray6
    }
    
    private func configureBarItems() {
        let postListVC = PostListViewController.instantiate(storyboardName: "PostList")
        postListVC.tabBarItem = .init(
            title: nil,
            image: UIImage.init(systemName: "line.3.horizontal"),
            tag: 0
        )
        let postsNC = UINavigationController.init(rootViewController: postListVC)
        
        let userInfoVC = UserInfoViewController.instantiate(storyboardName: "UserInfo")
        userInfoVC.tabBarItem = .init(
            title: nil,
            image: UIImage.init(systemName: "person"),
            tag: 1
        )
        let userNC = UINavigationController.init(rootViewController: userInfoVC)
        
        self.viewControllers = [postsNC, userNC]
    }
}

//
//  PostListViewController.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/08/28.
//

import UIKit
import FirebaseDatabase

final class PostListViewController: UIViewController {
    
    static func create() -> PostListViewController {
        let storyboard = UIStoryboard.init(name: "PostList", bundle: nil)
        let identifier = String.init(describing: Self.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! PostListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapAddDataButton(_ sender: UIButton) {
        let url = "https://fir-app-c82de-default-rtdb.asia-southeast1.firebasedatabase.app"
        let ref = Database.database(url: url).reference()
        ref.child("users").setValue(["name": "James"])
//        ref.child("users").child("name").setValue("Bob")
    }
}

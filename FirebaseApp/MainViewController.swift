//
//  MainViewController.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/08/28.
//

import UIKit
import FirebaseDatabase

final class MainViewController: UIViewController {
    
    static func create() -> MainViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let identifier = String.init(describing: Self.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! MainViewController
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

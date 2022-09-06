//
//  Instantiatable.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/09/06.
//

import UIKit

protocol Instantiatable: UIViewController {
    static func instantiate(storyboardName: String) -> Self
}

extension Instantiatable {
    static func instantiate(storyboardName: String) -> Self {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let identifier = String.init(describing: Self.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

//
//  RegistrationAlertController.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/09/06.
//

import UIKit

final class RegistrationAlertController: UIAlertController {
    
    convenience init(
        title: String?,
        message: String?
    ) {
        self.init(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        self.addTextField { textField in
            textField.placeholder = "제목"
        }
        
        let cancelAction = UIAlertAction.init(
            title: "취소",
            style: .cancel
        )
        self.addAction(cancelAction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addConfirmAction(_ handler: ((UIAlertAction) -> Void)?) {
        let confirmAction = UIAlertAction.init(
            title: "등록",
            style: .default,
            handler: handler
        )
        self.addAction(confirmAction)
    }
}

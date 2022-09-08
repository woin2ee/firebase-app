//
//  FirebaseDatabaseRepository.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/09/06.
//

import Foundation
import FirebaseDatabase

final class FirebaseDatabaseRepository {
    
    private let url = "https://fir-app-c82de-default-rtdb.asia-southeast1.firebasedatabase.app"
    private var ref: DatabaseReference {
        Database.database(url: url).reference()
    }
    
    func savePost(title: String) {
        let uuidString: String = UUID.init().uuidString
        let post: Post = .init(uuid: uuidString, title: title)
        self.ref.child("posts").childByAutoId().setValue(post.toDictionary)
    }
    
    func observePosts(with block: @escaping (DataSnapshot) -> Void) -> UInt {
        self.ref.child("posts").observe(.value, with: block)
    }
}

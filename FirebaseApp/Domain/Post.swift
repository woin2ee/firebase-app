//
//  Post.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/09/06.
//

import Foundation

struct Post {
    let title: String
    var contents: String = ""
    
    var toDictionary: [String: Any] {
        ["title": title, "contents": contents]
    }
}

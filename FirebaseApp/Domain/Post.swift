//
//  Post.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/09/06.
//

import Foundation

struct Post: Codable {
    let uuid: String
    let title: String
    var contents: String = ""
    let date: UInt
    
    var toDictionary: [String: Any] {
        [
            "uuid" : uuid,
            "title" : title,
            "contents" : contents,
            "date" : date
        ]
    }
}

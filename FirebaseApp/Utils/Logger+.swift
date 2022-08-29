//
//  Logger+.swift
//  FirebaseApp
//
//  Created by Jaewon on 2022/08/29.
//

import OSLog

extension Logger {
    static let subsystem = Bundle.main.bundleIdentifier!
    
    static let firebase = Logger.init(subsystem: subsystem, category: "Firebase")
}

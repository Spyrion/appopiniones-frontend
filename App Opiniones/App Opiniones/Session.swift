//
//  Session.swift
//  App Opiniones
//
//  Created by user181447 on 18/05/2021.
//

import Foundation

class Session : Codable {
    static let current = Session()
    private static let kArchiveKey = "ArchiveKey"
    
    var userName: String?
    var token: String?
    
    private init() {
        if let data = UserDefaults.standard.object(forKey: Session.kArchiveKey) as? Data {
            if let savedSession = try? PropertyListDecoder().decode(Session.self, from: data) {
                userName = savedSession.userName
                token = savedSession.token
            }
        }
        
        }
    static func save() {
        if let data = try? PropertyListEncoder().encode(current) {
            UserDefaults.standard.setValue(data, forKey: kArchiveKey)
        }
        
    }
}

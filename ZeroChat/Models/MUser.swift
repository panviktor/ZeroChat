//
//  MUser.swift
//  ZeroChat
//
//  Created by Viktor on 09.01.2021.
//

import Foundation
import FirebaseFirestore

struct MUser: Hashable, Decodable {
    var username: String
    var email: String
    var avatarStringURL: String
    var description: String
    var gender: String
    var id: String
    
    var representation: [String: Any] {
        var rep = ["username": username]
        rep["email"] = email
        rep["avatarStringURL"] = avatarStringURL
        rep["description"] = description
        rep["gender"] = gender
        rep["uid"] = id
        return rep
    }
    
    init(username: String, email: String, avatarStringURL: String, description: String, gender: String, id: String) {
        self.username = username
        self.email = email
        self.avatarStringURL = avatarStringURL
        self.description = description
        self.gender = gender
        self.id = id
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let username =  data["username"] as? String,
              let email = data["email"] as? String,
              let avatarStringURL = data["avatarStringURL"] as? String,
              let description = data["description"] as? String,
              let gender = data["gender"] as? String,
              let id = data["id"] as? String
        else { return nil }
        
        self.username = username
        self.email = email
        self.avatarStringURL = avatarStringURL
        self.description = description
        self.gender = gender
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}

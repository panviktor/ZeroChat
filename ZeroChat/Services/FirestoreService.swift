//
//  FirestoreService.swift
//  ZeroChat
//
//  Created by Viktor on 11.01.2021.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    static let shared = FirestoreService()
    private init(){}
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?,
                         description: String?, gender: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, gender: gender) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let muser = MUser(username: username!,
                          email: email,
                          avatarStringURL: "not exist",
                          description: description!,
                          gender: gender!,
                          id: id)
        self.usersRef.document(muser.id).setData(muser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
    }
    
    func getUserData(user: User,  completion: @escaping (Result<MUser, Error>) -> Void) {
        
    }
}

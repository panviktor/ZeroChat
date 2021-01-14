//
//  StorageService.swift
//  ZeroChat
//
//  Created by Viktor on 14.01.2021.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

class StorageService {
    static let shared = StorageService()
    private init() {}
    
    let storageRef = Storage.storage().reference()
    
    private var avatarRef: StorageReference {
        return storageRef.child("avatars")
    }
    
    private var currentUserId: String {
        return Auth.auth().currentUser!.uid
    }
    
    func upload(photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let scaledImage = photo.scaledToSafeUploadSize, let imageData = scaledImage.jpegData(compressionQuality: 0.4) else { return }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        avatarRef.child(currentUserId).putData(imageData, metadata: metadata) { (metadata, error) in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            self.avatarRef.child(self.currentUserId).downloadURL { (url, error) in
                guard let downloadURL = url else  {
                    completion(.failure(error!))
                    return
                }
                completion(.success(downloadURL))
            }
        }
    }
}

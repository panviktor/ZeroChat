//
//  UserError.swift
//  ZeroChat
//
//  Created by Viktor on 11.01.2021.
//

import Foundation

enum UserError: Error {
    case notFilled
    case photoNotExist
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User has not selected a photo", comment: "")
        }
    }
}

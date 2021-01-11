//
//  AuthError.swift
//  ZeroChat
//
//  Created by Viktor on 11.01.2021.
//

import Foundation

enum AuthError: Error {
    case notFilled
    case invalidEmail
    case passwordsNotMatched
    case serverError
    case unknownError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Wrong mail format", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("Password not matched ", comment: "")
        case .serverError:
            return NSLocalizedString("Server Error", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown Error", comment: "")
        }
    }
}

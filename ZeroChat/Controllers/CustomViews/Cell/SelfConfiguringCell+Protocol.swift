//
//  SelfConfiguringCell+Protocol.swift
//  ZeroChat
//
//  Created by Viktor on 08.01.2021.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}

//
//  WaitingChatsNavigation.swift
//  ZeroChat
//
//  Created by Viktor on 14.01.2021.
//

import Foundation

protocol WaitingChatsNavigation: class {
    func removeWaitingChat(chat: MChat)
    func changeToActive(chat: MChat)
}

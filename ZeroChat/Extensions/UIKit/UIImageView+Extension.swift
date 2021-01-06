//
//  UIImageView+Extension.swift
//  ZeroChat
//
//  Created by Viktor on 05.01.2021.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}

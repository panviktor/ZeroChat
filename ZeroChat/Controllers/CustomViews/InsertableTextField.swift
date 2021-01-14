//
//  InsertableTextField.swift
//  ZeroChat
//
//  Created by Viktor on 10.01.2021.
//

import UIKit

class InsertableTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        placeholder = "Write something here ..."
        font = UIFont.systemFont(ofSize: 14, weight: .medium)
        clearButtonMode = .whileEditing
        borderStyle = .none
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        let image = UIImage(systemName: "smiley")
        let imageView = UIImageView(image: image)
        imageView.setupColor(color: .lightGray)
        leftView = imageView
        leftView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        leftViewMode = .always
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Sent"), for: .normal)
        button.applyGradients(cornerRadius: 10)
        rightView = button
        rightView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        rightViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 12
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x += -12
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
}

import SwiftUI
struct InsertableTextFieldProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ProfileViewController(user: MUser(username: "Name", email: "email", avatarStringURL: "", description: "description", sex: "women", id: "1234123123"))
        func makeUIViewController(context: Context) -> ProfileViewController { return viewController }
        func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {}
    }
}

//
//  LoginViewController.swift
//  ZeroChat
//
//  Created by Viktor on 06.01.2021.
//

import UIKit


class LoginViewController: UIViewController {
    let screensize: CGRect = UIScreen.main.bounds
    
    let welcomeLabel = UILabel(text: "Welcome back!", font: .avenir26())
    let loginWithLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let needAnAccountLabel = UILabel(text: "Need an account?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .buttonDark, isShadow: false, cornerRadius: 5)
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.buttonRed, for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.height * 1.2)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContstaints()
    }
}

//MARK: - Setup constraints
extension LoginViewController {
    private func setupContstaints() {
        let screenWidth = screensize.width
        
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
                                            axis: .vertical,
                                            spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [
            loginWithView,
            orLabel,
            emailStackView,
            passwordStackView,
            loginButton
        ], axis: .vertical, spacing: 40)
        
        signUpButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [needAnAccountLabel, signUpButton],
                                          axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 2.0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -2.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2.0),
        ])
        
        scrollView.addSubview(welcomeLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidth * 0.025),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidth * 0.025),
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenWidth * 0.025),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -screenWidth * 0.025),
        ])
        
    }
}


import SwiftUI
struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> LoginViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {}
    }
}

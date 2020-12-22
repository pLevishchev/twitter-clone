//
//  LoginController.swift
//  TwitterClone
//
//  Created by Павел Левищев on 21.12.2020.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "TwitterLogo")
        
        return imageView
    }()
    
    private lazy var emailContainerView: UIView = {
        return Utilities().inputContainerView(with: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: UIView = {
        return Utilities().inputContainerView(with: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
    }()
    
    private let emailTextField: UITextField = {
        let textField = Utilities().textField(with: "Email")
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = Utilities().textField(with: "Password")
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account", " Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func handleLogin() {
        print("log in")
    }
    
    @objc func handleShowSignUp() {
        print("sign up")
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingLeft: 16,
                     paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 40,
                                     paddingRight: 40)
    }
}

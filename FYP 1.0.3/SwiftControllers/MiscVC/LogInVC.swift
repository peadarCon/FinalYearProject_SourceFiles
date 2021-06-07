//
//  ViewController.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 15/02/2021.
//

import UIKit

class LogInVC: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var radius = 22
    
    @objc func RegisterCalled() {
        guard let username = userTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else { return }
        AuthService.shared.signUp(username: username, password: password, email: email)
    }
    
    @objc func SignInCalled() {
        guard let username = userTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        AuthService.shared.signIn(username: username, password: password)
    }
    
    @objc func SignOutCalled() {
        AuthService.shared.signOutLocally()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        AuthService.shared.fetchCurrentAuthSession()
        
        emailTextField.layer.cornerRadius = CGFloat(radius)
        userTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        signInButton.layer.cornerRadius = CGFloat(radius)
        
        signUpButton.addTarget(self, action: #selector(RegisterCalled), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(SignInCalled), for: .touchUpInside)
//        signOutButton.addTarget(self, action: #selector(SignOutCalled), for: .touchUpInside)
    }


}


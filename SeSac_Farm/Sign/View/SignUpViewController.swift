//
//  SignUpViewController.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/03.
//


import UIKit


class SignUpViewController: UIViewController {
    
    let signUpView = SignUpView()
    
    
    override func loadView() {
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        signUpView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        
        signUpView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    
    @objc func startButtonClicked() {
        self.navigationController?.pushViewController(DetailSignUpViewController(), animated: true)
    }
    
    @objc func loginButtonClicked() {
        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
  
}

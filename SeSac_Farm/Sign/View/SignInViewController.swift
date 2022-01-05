//
//  SignInViewController.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/05.
//

import UIKit


class SignInViewController: UIViewController {
    
    let signInView = SignInView()
    let signInViewModel = SiginViewModel()
    
    override func loadView() {
        self.view = signInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "새싹 농장 로그인"
        signInBind()
        signInAction()
    }
    
    func signInBind() {
        
        signInViewModel.email.bind { text in
            self.signInView.userEmailTextField.text = text
        }
        
        signInViewModel.password.bind { text in
            self.signInView.userPasswordTextField.text = text
        }
    }
    
    func signInAction() {
        
        signInView.userEmailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
        signInView.userPasswordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        signInView.signInButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        signInViewModel.email.value = textField.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(_ textField: UITextField) {
        signInViewModel.password.value = textField.text ?? ""
    }
    
    @objc func loginButtonClicked() {
        signInViewModel.postUserSignIn { error in
            
            if let loginError = error {
                print("로그인 에러: \(loginError)")
            } else {
                print("로그인 성공")
                print("token:", self.signInViewModel.signIn.value.jwt)
                
            }
        }
    }
    
}

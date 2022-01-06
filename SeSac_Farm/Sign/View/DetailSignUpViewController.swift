//
//  DetailSignUpViewController.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import UIKit


class DetailSignUpViewController: UIViewController {
    
    
    let signUpView = DetailSignUpView()
    let signUpViewModel = DetailSignUpViewModel()

    
    override func loadView() {
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "바람의나라 문파 가입하기"
        signUpBind()
        signUpAction()
    }
    
    func signUpBind() {
        signUpViewModel.username.bind { text in
            self.signUpView.userNameTextField.text = text
        }
        
        signUpViewModel.email.bind { text in
            self.signUpView.userEmailTextField.text = text
        }
        
        signUpViewModel.password.bind { text in
            self.signUpView.userPasswordTextField.text = text
        }
        
        
    }
    
    func signUpAction() {
        signUpView.userNameTextField.addTarget(self, action: #selector(nicknameTextFieldDidChange(_:)), for: .editingChanged)
        signUpView.userEmailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
        signUpView.userPasswordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
    }
    
    
    @objc func nicknameTextFieldDidChange(_ textField: UITextField) {
        signUpViewModel.username.value = textField.text ?? ""
    }
    
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        signUpViewModel.email.value = textField.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(_ textField: UITextField) {
        signUpViewModel.password.value = textField.text ?? ""
    }
    
    
    @objc func signUpButtonClicked() {
        
        // password 비교
        if signUpView.userPasswordTextField.text == signUpView.confirmPasswordTextField.text {
            signUpViewModel.postUserSignUp {
                // Alert 이나 토스트로
                print("회원가입 완료")
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            // Alert 이나 토스트로
            print("비밀번호가 다름")
        }
        
    }
    
}




//
//  DetailSignUpView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import UIKit
import SnapKit


class DetailSignUpView : UIView {
    
    let userEmailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "이메일 주소"
        textField.layer.borderWidth = 1
        return textField
    }()
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "닉네임"
        textField.layer.borderWidth = 1
        return textField
    }()
    let userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "비밀번호"
        textField.layer.borderWidth = 1
        return textField
    }()
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "비밀번호 확인"
        textField.layer.borderWidth = 1
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("가입하기", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    func setupView() {
        
        addSubview(userEmailTextField)
        addSubview(userNameTextField)
        addSubview(userPasswordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
    }
    
    func setupConstraints() {
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        userPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(userPasswordTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
}

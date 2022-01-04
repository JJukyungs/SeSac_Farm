//
//  DetailSignUpView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import UIKit
import SnapKit


class DetailSignUpView : UIView {
    
    let userEmailTextField = UITextField()
    let userNameTextField = UITextField()
    let userPasswordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    
    let signUpButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    func setupView() {
        
        addSubview(userEmailTextField)
        userEmailTextField.backgroundColor = .white
        userEmailTextField.placeholder = "이메일 주소"
        
        addSubview(userNameTextField)
        userNameTextField.backgroundColor = .white
        userNameTextField.placeholder = "닉네임"
       
        addSubview(userPasswordTextField)
        userPasswordTextField.backgroundColor = .white
        userPasswordTextField.placeholder = "비밀번호"
        
        addSubview(confirmPasswordTextField)
        confirmPasswordTextField.backgroundColor = .white
        confirmPasswordTextField.placeholder = "비밀번호 확인"
        
        addSubview(signUpButton)
        signUpButton.backgroundColor = .orange
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.tintColor = .white
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

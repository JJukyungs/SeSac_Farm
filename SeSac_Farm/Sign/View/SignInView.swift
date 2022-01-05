//
//  SignInView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/05.
//

import Foundation
import UIKit


class SignInView: UIView {
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "logo_ssac_clear")
        return imageView
    }()
    
    let userEmailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "이메일"
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
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 8
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
        addSubview(logoImage)
        addSubview(userEmailTextField)
        addSubview(userPasswordTextField)
        addSubview(signInButton)
    }
    
    func setupConstraints() {
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        userPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(userPasswordTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
}

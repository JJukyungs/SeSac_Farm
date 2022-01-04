//
//  SignUpView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/03.
//

import UIKit
import SnapKit


protocol SignUpViewRepersentalbe {
    func setupView()
    func setupConstraints()
}

class SignUpView: UIView, SignUpViewRepersentalbe {
    
    let logoImage = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let startButton = UIButton()
    let loginButton = UIButton()
    
    
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
        logoImage.image = UIImage(named: "logo_ssac_clear")
        logoImage.contentMode = .scaleAspectFill
        addSubview(titleLabel)
        titleLabel.text = "당신 근처의 새싹 농장"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        addSubview(subTitleLabel)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.text = "iOS 지식부터 바람의나라 까지 지금 SeSac에서 함께해보세요!"
        subTitleLabel.textAlignment = .center
        
        addSubview(startButton)
        startButton.setTitle("시작하기", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .green
        startButton.layer.cornerRadius = 8
        
        
        addSubview(loginButton)
        let loginButtonText = "이미 계정이 있나요? 로그인"
//        loginButton.setTitle(loginButtonText, for: .normal)
        loginButton.setTitleColor(.lightGray, for: .normal)
        let loginText = NSMutableAttributedString(string: loginButtonText)
        loginText.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 11, length: 4))
        loginButton.setAttributedTitle(loginText, for: .normal)
    }
    
    func setupConstraints() {
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(200)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.7)
            make.height.equalTo(50)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.7)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(loginButton.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        
    }
}

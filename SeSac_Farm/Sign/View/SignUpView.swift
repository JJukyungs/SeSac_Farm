//
//  SignUpView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/03.
//

import UIKit
import SnapKit




class SignUpView: UIView {
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "logo_ssac_clear")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "당신 근처의 새싹 농장"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "바람의나라:연 지식부터 iOS까지 지금 SeSac에서 함께해보세요!"
        label.textAlignment = .center
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 8
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        let loginButtonText = "이미 계정이 있나요? 로그인"
        button.setTitleColor(.lightGray, for: .normal)
        let loginText = NSMutableAttributedString(string: loginButtonText)
        loginText.addAttribute(.foregroundColor, value: UIColor.green, range: NSRange(location: 11, length: 4))
        button.setAttributedTitle(loginText, for: .normal)
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
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(startButton)
        addSubview(loginButton)
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

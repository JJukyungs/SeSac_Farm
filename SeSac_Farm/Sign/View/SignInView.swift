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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

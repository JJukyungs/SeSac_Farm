//
//  DetailPostView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit
import SnapKit


class DetailPostView: UIView {
    
    // top stack View 안에 또 작은 stackview
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let createDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    let topStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 20
        sv.distribution = .fill
        return sv
    }()
    
    // 닉네임 , 날짜 들어갈 스택뷰
    let topSmallStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 3
        sv.distribution = .fillEqually
        return sv
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let bottomStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        sv.spacing = 20
        return sv
    }()
    
    let messageImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "message")
        image.tintColor = .lightGray
        return image
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    // tableView
    var tableView = UITableView()
    
    let commentTextfield : UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .lightGray
        textfield.layer.cornerRadius = 8
        textfield.placeholder = " 댓글을 입력해주세요"
        return textfield
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUIView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) error")
    }
    
    func setUIView() {
        addSubview(topStackView)
        topStackView.addArrangedSubview(profileImage)
        topStackView.addArrangedSubview(topSmallStackView)
        topSmallStackView.addArrangedSubview(usernameLabel)
        topSmallStackView.addArrangedSubview(createDateLabel)
        addSubview(contentLabel)
        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(messageImageView)
        bottomStackView.addArrangedSubview(commentLabel)
        
        // tableView 로 넣을듯 코멘트 부분은
        addSubview(tableView)
        
        addSubview(commentTextfield)
        

        tableView.backgroundColor = .red
    }
    
    func setConstraints() {
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(60)
        }
        profileImage.snp.makeConstraints { make in
            make.size.equalTo(60)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(bottomStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        
        commentTextfield.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(50)
        }
    }
    
}

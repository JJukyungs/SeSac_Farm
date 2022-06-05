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
    
//    let commentTextfield : UITextField = {
//        let textfield = UITextField()
//        textfield.backgroundColor = .lightGray
//        textfield.layer.cornerRadius = 8
//        textfield.placeholder = " 댓글을 입력해주세요"
//        return textfield
//    }()
    
    let commentTextview: UITextView = {
        let textview = UITextView()
        textview.backgroundColor = .lightGray
        textview.layer.cornerRadius = 8
        return textview
    }()
    
    
    // postOptinoButton
    var postOptionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // writeCommentButton
    var writeCommentButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        return button
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

        addSubview(profileImage)
        addSubview(usernameLabel)
        addSubview(postOptionButton)
        postOptionButton.isHidden = false
        addSubview(createDateLabel)
        
        
        addSubview(contentLabel)
        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(messageImageView)
        bottomStackView.addArrangedSubview(commentLabel)
        
        // tableView 로 넣을듯 코멘트 부분은
        addSubview(tableView)
        
//        addSubview(commentTextfield)
        addSubview(commentTextview)
        
        
        addSubview(writeCommentButton)
    }
    
    func setConstraints() {

        profileImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(15)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(60)
        }
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.top)
            make.leading.equalTo(profileImage.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-30)
        }
        createDateLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.equalTo(profileImage.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-30)
        }
        // postOptionbutton
        postOptionButton.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.top)
            make.trailing.equalToSuperview().offset(-5)
            make.size.equalTo(40)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(10)
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
        
        commentTextview.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(writeCommentButton.snp.leading).offset(-5)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        writeCommentButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.size.equalTo(80)
        }
    }
    
}

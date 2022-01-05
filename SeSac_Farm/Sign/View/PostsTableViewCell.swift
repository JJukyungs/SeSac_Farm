//
//  PostsTableViewCell.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit
import SnapKit


class PostsTableViewCell: UITableViewCell {
    
    static let identifier = "PostTableViewCell"
    
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    let cententLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let creteDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    let bottomStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        sv.spacing = 10
        return sv
    }()
    
    let messageImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "message")
        image.tintColor = .lightGray
        return image
    }()
    
    let commentButton: UIButton = {
        let bt = UIButton()
        bt.setTitleColor(.lightGray, for: .normal)
        bt.backgroundColor = .white
        return bt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setUIView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        //super.init(coder: coder)
        fatalError("init(coder)에러")
    }
    
    
    func setUIView() {
        addSubview(userNameLabel)
        addSubview(cententLabel)
        addSubview(creteDateLabel)
        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(messageImageView)
        bottomStackView.addArrangedSubview(commentButton)
    }
    
    func setConstraints() {
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        cententLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)

        }
        creteDateLabel.snp.makeConstraints { make in
            make.top.equalTo(cententLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)

        }
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(creteDateLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        
    }
}

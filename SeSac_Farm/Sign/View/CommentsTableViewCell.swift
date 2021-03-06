//
//  CommentsTableViewCell.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit
import SnapKit


protocol CommentCellButtonAction {
    func cellOptionButtonClicked()
}

class CommentsTableViewCell: UITableViewCell {
    
    static let identifier = "CommentsTableViewCell"
    
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let optionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUIView()
        setConstraints()
    
        contentView.isUserInteractionEnabled = true
      
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) 에러")
    }
    
    
    func setUIView() {
        addSubview(usernameLabel)
        addSubview(contentLabel)
        addSubview(optionButton)
    }
    
    func setConstraints() {
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        optionButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-5)
            make.size.equalTo(30)
        }
    }
}

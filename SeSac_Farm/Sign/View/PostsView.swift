//
//  PostsView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import Foundation
import UIKit


class PostsView: UIView {
    
    var tableView = UITableView()
    
    let writeButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius =  30
        
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
        addSubview(tableView)
        addSubview(writeButton)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        writeButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(60)
            
        }
    }
    
    
}

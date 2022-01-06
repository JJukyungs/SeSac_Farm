//
//  WritePostView.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit
import SnapKit

class WritePostView: UIView {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.font = .systemFont(ofSize: 16)
        return tv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        addSubview(textView)
        
        textView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    
}

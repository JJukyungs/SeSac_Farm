//
//  WritePostViewController.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit

class WritePostViewController: UIViewController {
    
    
    let writePosteView = WritePostView()
    let writePosteViewModel = WritePostViewModel()
    
    
    
    override func loadView() {
        self.view = writePosteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "새싹 농장 글쓰기"
        view.backgroundColor = .lightGray
        
        // navigationItem 추가
        // 확인
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(okDoneButtonClicked))]
    
        // 취소
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonClicked))]
        
    }
    
    @objc func okDoneButtonClicked() {
        print("ok")
        
        writePosteViewModel.writePost(text: writePosteView.textView.text) {
            print("작성")
        }
        self.navigationController?.popViewController(animated: true)

    }
    
    @objc func cancelButtonClicked() {
        print("cancel")
        self.navigationController?.popViewController(animated: true)
    }
    
}

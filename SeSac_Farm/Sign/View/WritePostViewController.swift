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
    
    var titleStatus: Bool = true
    
    override func loadView() {
        self.view = writePosteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        // navigationItem 추가
        // 확인

        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(okDoneButtonClicked))]
        
        // 취소
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(cancelButtonClicked))]
        
        // 이걸 추가 안해서 업데이트가 안됐넹
        writePosteViewModel.writePost.bind { post in
            self.writePosteView.textView.text = post.text
        }
        
        if titleStatus {
            title = "새싹 농장 글쓰기"
        } else {
            title = "새싹 농장 글 수정"

        }
    }
    
    @objc func okDoneButtonClicked() {
        
        if titleStatus {
            writePosteViewModel.writePost(text: writePosteView.textView.text) {
                self.navigationController?.popViewController(animated: true)
            }
            print("titleStatus",titleStatus)
        } else {
            writePosteViewModel.updatePost(postId: writePosteViewModel.writePost.value.id, text: writePosteView.textView.text) {
                self.navigationController?.popViewController(animated: true)
            }
            print("titleStatus",titleStatus)
            
        }

    }
    
    @objc func cancelButtonClicked() {
        print("cancel")
        self.navigationController?.popViewController(animated: true)
    }
    
}

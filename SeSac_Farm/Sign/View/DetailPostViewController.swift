//
//  DetailPostViewController.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    let detailPostView = DetailPostView()
    let viewModel = DetailPostViewModel()
    
    
    
     
    
    override func loadView() {
        self.view = detailPostView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        viewModel.detailPost(postId: viewModel.detailPosts.value.id) {
            self.detailPostView.contentLabel.text = self.viewModel.detailPosts.value.text
        }
        
        
        viewModel.viewComments(postId: viewModel.detailPosts.value.id) {
            
        }
       
        viewModel.postId.bind { postId in
            
        }
        viewModel.comments.bind { comment in
            
            self.detailPostView.commentLabel.text = "댓글 \(comment.count)개"
            self.detailPostView.tableView.reloadData()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
      
        viewModel.detailPost(postId: viewModel.postId.value) {
            
        }
        
        viewModel.viewComments(postId: viewModel.postId.value) {
            
        }
        
        viewModel.postId.bind { postId in
            
        }
        
        viewModel.comments.bind { comment in
            self.detailPostView.tableView.reloadData()
        }
      
        viewModel.comment.bind { comment in
            self.detailPostView.commentTextview.text = ""
        }
        
        // 왜 안 받아와질까
        print("DetailPost: \(viewModel.postId.value)")
        print("DetailPost: \(viewModel.detailPosts.value.id)")
        
        
        detailPostView.usernameLabel.text = viewModel.detailPosts.value.user.username
        detailPostView.contentLabel.text = viewModel.detailPosts.value.text
        detailPostView.commentLabel.text = "댓글 \(viewModel.detailPosts.value.comments.count)개"
        detailPostView.createDateLabel.text = viewModel.detailPosts.value.createdAt
        
        
        
        setTableView()
        
        postOptionButton()
       
        detailPostView.writeCommentButton.addTarget(self, action: #selector(writeButtonClicked), for: .touchUpInside)
    }
    
    func setTableView() {
        detailPostView.tableView.delegate = self
        detailPostView.tableView.dataSource = self
        detailPostView.tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)

        detailPostView.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    // 수정, 삭제
    func postOptionButton() {
        // true , false 로 자기 post option 버튼 보여주기
        let myPostIdStatus: Bool = viewModel.detailPosts.value.user.id != UserDefaults.standard.integer(forKey: "userId")
        
        detailPostView.postOptionButton.isHidden = myPostIdStatus
        detailPostView.postOptionButton.addTarget(self, action: #selector(postOptionButtonClicked), for: .touchUpInside)
    }
    
    
    @objc func writeButtonClicked() {
        viewModel.writeComment(comment: detailPostView.commentTextview.text ?? "", postId: viewModel.postId.value) {
            print("writeButtonClicked")
        }
        
    }
    
    
    @objc func postOptionButtonClicked() {
        print("postOptionButtonClicekd")
        
        // alert
        let alert = UIAlertController(title: "수정 / 삭제", message: "포스트를 수정 / 삭제 하겠습니까?", preferredStyle: .alert)
        
        // 수정
        let updatePost = UIAlertAction(title: "수정", style: .default) { action in
            
            // writePostViewController로
            let vc = WritePostViewController()
            
            vc.writePosteViewModel.writePost.value = self.viewModel.detailPosts.value
            print(vc.writePosteViewModel.writePost.value)
            vc.titleStatus = false

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        // 삭제
        let deletePost = UIAlertAction(title: "삭제", style: .default) { action in
            self.deleteCheckPostAlert()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(updatePost)
        alert.addAction(deletePost)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func deleteCheckPostAlert() {
        let alert = UIAlertController(title: "포스트 삭제", message: "정말로 포스트 글을 삭제하실려고요?????", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "삭제", style: .default) { action in
            
            self.viewModel.deletePost(postId: self.viewModel.detailPosts.value.id) {
                
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func commentOptionButtonClicked(sender: UIButton) {
        print("commentOptionButtonClicked")
        
        
        let alert = UIAlertController(title: "수정 / 삭제", message: "댓글을 수정 / 삭제 하시겠습니까?", preferredStyle: .alert)
        
        let update = UIAlertAction(title: "수정", style: .default) {  action in
            
            print("수정")
    
        }
        
        let delete = UIAlertAction(title: "삭제", style: .default) { action in
            print("삭제")
            self.viewModel.comment.value = self.viewModel.comments.value[sender.tag]
            
            self.deleteCheckCommentAlert()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(update)
        alert.addAction(delete)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    // 댓글 삭제 alert
    func deleteCheckCommentAlert() {
        
        let alert = UIAlertController(title: "댓글 삭제", message: "정말로 댓글을 삭제하실려고요?????", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "삭제", style: .default) { action in
           
            self.viewModel.deleteComment(commentId: self.viewModel.comment.value.id) {
                print("comment delete")
                
                self.viewModel.viewComments(postId: self.viewModel.detailPosts.value.id)
                {
                    
                }
                
                self.viewModel.viewComments(postId: self.viewModel.detailPosts.value.id)
                {
                    self.detailPostView.tableView.reloadData()
                }
            }
            
            self.viewModel.comments.bind { comment in
                self.detailPostView.commentLabel.text = "댓글 \(comment.count)"
                
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension DetailPostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as? CommentsTableViewCell else { return UITableViewCell() }
        
        let row = viewModel.cellForRowAt(indexPath: indexPath)
        print("row")
        print(row)
        print(row)
        print(row)
        
        print("cell \(row.comment)")
        cell.usernameLabel.text = row.user.username
        cell.contentLabel.text = row.comment
        
        let optionButtonStatus = row.user.id == UserDefaults.standard.integer(forKey: "userId")
        
        cell.optionButton.isHidden = !optionButtonStatus
        
        cell.optionButton.tag = indexPath.row + 100
        cell.optionButton.addTarget(self, action: #selector(commentOptionButtonClicked(sender:)), for: .touchUpInside)
       
        
        return cell
    }
    
    
}

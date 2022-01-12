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
        viewModel.comment.bind { comment in
            
            self.detailPostView.commentLabel.text = "댓글 \(comment.comment)개"
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
      
        
        // 왜 안 받아와질까
        print("DetailPost: \(viewModel.postId.value)")
        print("DetailPost: \(viewModel.detailPosts.value.id)")
        
        
        detailPostView.usernameLabel.text = viewModel.detailPosts.value.user.username
        detailPostView.contentLabel.text = viewModel.detailPosts.value.text
        detailPostView.commentLabel.text = "댓글 \(viewModel.detailPosts.value.comments.count)개"
        detailPostView.createDateLabel.text = viewModel.detailPosts.value.createdAt
        
//        setTableView()
        
        detailPostView.tableView.delegate = self
        detailPostView.tableView.dataSource = self
        detailPostView.tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
        detailPostView.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    
//    func setTableView() {
//        detailPostView.tableView.delegate = self
//        detailPostView.tableView.dataSource = self
//        detailPostView.tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
//
//        detailPostView.tableView.rowHeight = UITableView.automaticDimension
//
//    }
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
        

        
        
        return cell
    }
    
    
}

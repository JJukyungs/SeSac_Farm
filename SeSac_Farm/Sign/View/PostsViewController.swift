//
//  PostViewController.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit

class PostsViewController: UIViewController {
    
    let postView = PostsView()
    
    let viewModel = PostsViewModel()
    
    override func loadView() {
        self.view = postView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        postView.tableView.delegate = self
        postView.tableView.dataSource = self
        postView.tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.identifier)
    
        postView.tableView.rowHeight = UITableView.automaticDimension
    
        // 요걸 안하니 안불러와져서 안나왔던거구나..
        viewModel.getPosts {
            
        }
        
        // bind 처리
        viewModel.getPosts.bind { post in
            self.postView.tableView.reloadData()
        }
        
    }
    
    
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier, for: indexPath) as? PostsTableViewCell else { return UITableViewCell() }
        
        let row = viewModel.cellForRowAt(indexPath: indexPath)
        
        cell.userNameLabel.text = row.user.username
        cell.cententLabel.text = row.text
        cell.creteDateLabel.text = row.createdAt
        
        if row.comments.count == 0 {
            cell.commentButton.setTitle("댓글 작성", for: .normal)
        } else {
            cell.commentButton.setTitle("댓글 \(row.comments.count)개", for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

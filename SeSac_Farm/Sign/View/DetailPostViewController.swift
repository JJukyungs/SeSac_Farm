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
    
    var postId: Int = 0
    var commentCount = 0
    
     
    
    override func loadView() {
        self.view = detailPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func setTableView() {
        detailPostView.tableView.delegate = self
        detailPostView.tableView.dataSource = self
        detailPostView.tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
        
        detailPostView.tableView.rowHeight = UITableView.automaticDimension
        
//        viewModel.getComments(postId: postId) {
//            
//        }
//        viewModel.getComment.bind { comment in
//            self.detailPostView.tableView.reloadData()
//        }
        
    }
}

extension DetailPostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as? CommentsTableViewCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
    
}

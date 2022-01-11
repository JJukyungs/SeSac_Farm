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
        
        setTableView()
        
        postView.writeButton.addTarget(self, action: #selector(writeButtonClicked), for: .touchUpInside)
    }
    
    // test 중
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getPosts {
            self.postView.tableView.reloadData()
        }
        
    }
    
    func setTableView() {
        
        postView.tableView.delegate = self
        postView.tableView.dataSource = self
        postView.tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.identifier)
    
        // 높이조절 [Jack님이 레이아웃부분 문제 해결하라고해서 해결]
        postView.tableView.rowHeight = UITableView.automaticDimension
    
        // 요걸 안하니 안불러와져서 안나왔던거구나..
        viewModel.getPosts {
            
        }
        
        // bind 처리
        viewModel.getPosts.bind { post in
            self.postView.tableView.reloadData()
        }
    }
    
    @objc func writeButtonClicked() {
        print("writeButton")
        self.navigationController?.pushViewController(WritePostViewController(), animated: true)
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
            cell.commentLabel.text = "댓글 작성하기"
        } else {
            cell.commentLabel.text = "댓글 \(row.comments.count)개"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let row = viewModel.cellForRowAt(indexPath: indexPath)
        let row = self.viewModel.getPosts.value[indexPath.row]
        
        let vc = DetailPostViewController()
        print("postView -> DetailPost")
        print(row.id)
        print(row.comments.count)
        print(row.comments)
        
        vc.viewModel.detailPosts.value = row
        vc.viewModel.postId.value = row.id
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

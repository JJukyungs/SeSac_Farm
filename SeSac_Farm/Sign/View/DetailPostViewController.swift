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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    func setTableView() {
        detailPostView.tableView.delegate = self
        detailPostView.tableView.dataSource = self
    }
}

extension DetailPostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as? CommentsTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
    
}

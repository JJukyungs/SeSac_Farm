//
//  DetailPostViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit

class DetailPostViewModel {
 
    // 나눠서 생각을 해보자 post 부분 나와야하고 comment 부분 나와야함 한번에 하지말고 따로
    
    
    var postId: Observable<Int> = Observable(0)
    
    var detailPosts: Observable<Post> = Observable(Post(id: 0, text: "", user: UserPosts(id: 0, username: "", email: "", provider: .local, confirmed: false, blocked: false, role: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: "", comments: []))
    
    var comment: Observable<Comment> = Observable(Comment(id: 0, comment: "", user: UserComment(id: 0, username: "", email: "", provider: .local, confirmed: true, blocked: false, role: 0, createdAt: "", updatedAt: ""), post: PostComent(id: 0, text: "", user: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: ""))

    
    
//    var comments: Observable<Comment> = Observable(Comments())
    
    
    
    // 한개 포스트 디테일로 보기
    
    func detailPost(postId: Int, completion: @escaping () -> Void) {
        print("detailPost 연결")
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        
        
    }
    
    
    // 코멘트
    
    func viewComments(postId: Int, completion: @escaping () -> Void) {

        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        print("comment 연결")
        APIService.commentsView(token: token, postId: postId) { post, error in
            
            
            completion()
        }
    }
    
    
   
    
     
}

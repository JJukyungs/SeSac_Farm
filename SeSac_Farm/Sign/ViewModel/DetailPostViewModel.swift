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
    
    var comment: Observable<Comment> = Observable(Comment(id: 0, comment: "", user: UserComent(id: 0, username: "", email: "", provider: .local, confirmed: true, blocked: false, role: 0, createdAt: "", updatedAt: ""), post: PostComent(id: 0, text: "", user: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: ""))

    
    // 코멘트
    
    func viewComments(postId: Int, completion: @escaping () -> Void) {
        // post 에서 들어가면 토큰은 있으니깐
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.detailPost(token: token, postId: postId) { comment, error in
            
            guard let comment = comment else {
                return
            }
            self.comment.value = comment
            completion()
        }
    }
    
    
     
}

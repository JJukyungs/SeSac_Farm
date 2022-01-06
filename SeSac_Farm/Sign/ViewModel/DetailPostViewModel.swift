//
//  DetailPostViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit

class DetailPostViewModel {
    
    var ditailPost: Observable<Post> = Observable(Post(id: 0, text: "", user: UserPosts(id: 0, username: "", email: "", provider: .local, confirmed: false, blocked: false, role: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: "", comments: []))
    
    func getDetailPost(postId: Int, completion: @escaping () -> Void) {
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.detailPost(token: token, postId: postId) { post, error in
            
            guard let post = post else {
                return
            }

            self.ditailPost.value = post
            
            completion()
        }
    }
    
}



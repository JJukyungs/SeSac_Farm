//
//  WritePostViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit


class WritePostViewModel {
    
    var writePost: Observable<Post> = Observable(Post(id: 0, text: "", user: UserPosts(id: 0, username: "", email: "", provider: .local, confirmed: false, blocked: false, role: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: "", comments: []))
    
    func writePost(text: String, completion: @escaping () -> Void) {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.writePost(token: token, text: text) { post, error in
            
            guard let post = post else {
                return
            }
            self.writePost.value = post
            
            completion()
        }
    }
    
    func updatePost(postId: Int, text: String, completion: @escaping () -> Void) {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        print("updatePost")
        
        APIService.updatePost(token: token, postId: postId, text: text) { post, error in
            
            guard let post = post else {
                return
            }
            self.writePost.value = post
            
            completion()
        }
    }
    
}

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

    
    
    var comments: Observable<Comments> = Observable(Comments())
    
    
    
    // 한개 포스트 디테일로 보기
    
    func detailPost(postId: Int, completion: @escaping () -> Void) {
        print("detailPost 연결")
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.detailPost(token: token, postId: postId) { post, error in
            
            guard let post = post else {
                return
            }
            
            self.postId.value = postId
            self.detailPosts.value = post
            
            completion()
        }
        
        
    }
    
    
    // 코멘트
    
    func viewComments(postId: Int, completion: @escaping () -> Void) {

        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        print("comment 연결")
        
        APIService.commentsView(token: token, postId: postId) { comment, error in
            
//            print("comment ->",comment)
          
            guard let comment = comment else {
                return
            }
            self.comments.value = comment
            completion()
        }
    }
    
    
    // Post 삭제
    
    func deletePost(postId: Int, completion: @escaping () -> Void) {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        print("postDelete")
        
        APIService.deletePost(token: token, postId: postId) { post, error in
            guard let post = post else {
                return
            }
            self.detailPosts.value = post
            completion()
        }
    }
    
   
    
    // comment 작성 테스트
    
    func writeComment(comment: String, postId: Int, completion: @escaping () -> Void) {
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.writeComment(token: token, postId: postId, comment: comment) { comment, error in
            
            guard let comment = comment else {
                return
            }
            
            self.comment.value = comment
            
            completion()
        }
    }
    
    // comment 수정
    
    func updateComment(postId: Int, commentId: Int, comment: String, completion: @escaping () -> Void) {
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.updateComment(token: token, commentId: commentId, postId: postId, comment: comment) { comment, error in
            
            guard let comment = comment else {
                return
            }
            
            self.comment.value = comment
            completion()
        }
    }
    
    // comment 삭제
    
    func deleteComment(commentId: Int, completion: @escaping () -> Void) {
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        APIService.deleteComment(token: token, commentId: commentId) { comment, error in
            
            guard let comment = comment else {
                return
            }
            
            self.comment.value = comment
            completion()
        }
    }
    
   
    
     
}

extension DetailPostViewModel {
    var numberOfRowsInSection: Int {
        print("numberOfRowInSection: \(comments.value.count)")
        return comments.value.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Comment {
        return comments.value[indexPath.row]
    }
}

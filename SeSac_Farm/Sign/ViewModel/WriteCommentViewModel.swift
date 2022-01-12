//
//  WriteCommentViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/13.
//

import Foundation

class WriteCommentViewModel {
    
    var comment: Observable<Comment> = Observable(Comment(id: 0, comment: "", user: UserComment(id: 0, username: "", email: "", provider: .local, confirmed: true, blocked: false, role: 0, createdAt: "", updatedAt: ""), post: PostComent(id: 0, text: "", user: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: ""))

    
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
    
}

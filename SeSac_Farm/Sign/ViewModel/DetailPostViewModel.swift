//
//  DetailPostViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit

class DetailPostViewModel {
    
}


//class DetailPostViewModel {
//
//    var ditailPost: Observable<Post> = Observable(Post(id: 0, text: "", user: UserPosts(id: 0, username: "", email: "", provider: .local, confirmed: false, blocked: false, role: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: "", comments: []))
//
//
//    func getDetailPost(postId: Int, completion: @escaping () -> Void) {
//
//        let token = UserDefaults.standard.string(forKey: "token") ?? ""
//
//        APIService.detailPost(token: token, postId: postId) { post, error in
//
//            guard let post = post else {
//                return
//            }
//
//
//            self.ditailPost.value = post
//
//            completion()
//        }
//    }
//
//}

//class CommetPostViewModel {
//
////    var getComments: Observable<Comment> = Observable(Comment(id: 0, comment: "", user: 0, post: 0, createdAt: "", updatedAt: ""))
//
//    var getPostComments: Observable<Posts> = Observable(Posts())
//
//
//    func getPostComments(postId: Int, completion: @escaping () -> Void) {
//
//        let token = UserDefaults.standard.string(forKey: "token") ?? ""
//
//        APIService.detailPost(token: token, postId: postId) { post, error in
//
//            guard let post = post else {
//                return
//            }
//
//            self.getPostComments.value = post
//
//            completion()
//        }
//    }
//}
//
//
//extension CommetPostViewModel {
//
//    func cellForRowAt(indexPath: IndexPath) -> Post {
//        return getComments.value.comment[indexPath.row]
//    }
//
////    func numberOfRowInSection {
////        return getComments.value.comment.count
////    }
//}

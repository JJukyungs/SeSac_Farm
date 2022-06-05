//
//  PostsViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/06.
//

import UIKit


class PostsViewModel {
    
    var getPosts: Observable<Posts> = Observable(Posts())
    
    func getPosts(completion: @escaping () -> Void) {
        
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        print(token)
        
        APIService.getPosts(token: token) { post, error in
            
        
            guard let post = post else {
                return
            }

            self.getPosts.value = post
            
            completion()
        }
    }
}


extension PostsViewModel {
    
    func cellForRowAt(indexPath: IndexPath) -> Post {
        return getPosts.value[indexPath.row]
    }
    
    var numberOfRowInSection: Int {
        return getPosts.value.count
    }
}

//
//  SignInViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/05.
//

import UIKit

class SiginViewModel {
    
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    var signIn: Observable<User> = Observable(User(jwt: "", user: UserClass(id: 0, username: "", email: "", provider: "", confirmed: true, role: Role(id: 0, name: "", roleDescription: "", type: ""), createdAt: "", updatedAt: "")))

    func postUserSignIn(completion: @escaping (APIError?) -> Void) {
        APIService.signIn(identifier: email.value, password: password.value) { userData, error in
            
            if let error = error {
                print("error : \(error)")
            }
            
            
            guard let userData = userData else {
                
                return
            }
            
            self.signIn.value = userData
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.id, forKey: "userId")
            print("token: \(userData.jwt)")
            
            
            completion(nil)
        }
        
    }
}

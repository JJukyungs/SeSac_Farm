//
//  SignUpViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import UIKit

class DetailSignUpViewModel {
    
    var username: Observable<String> = Observable("")
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    var signUp: Observable<User> = Observable(User(jwt: "", user: UserClass(id: 0, username: "", email: "", provider: "", confirmed: true, role: Role(id: 0, name: "", roleDescription: "", type: ""), createdAt: "", updatedAt: "")))
    
    func postUserSignUp(comletion: @escaping () -> Void) {
        APIService.signUp(email: email.value, username: username.value, password: password.value) { userData, error in
            
            
            guard let userData = userData else {
                return
            }

            self.signUp.value = userData

            
            comletion()

        }
    }
}

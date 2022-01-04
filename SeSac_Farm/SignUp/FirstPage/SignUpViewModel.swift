//
//  SignUpViewModel.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import UIKit

class SignUpViewModel {
    
    var username: Observable<String> = Observable("")
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    func postUserSignUp(comletion: @escaping () -> Void) {
        APIService.signUp(email: email.value, username: username.value, password: password.value) { userData, error in
            
            guard let userData = userData else {
                return
            }
            
            comletion()

        }
    }
}

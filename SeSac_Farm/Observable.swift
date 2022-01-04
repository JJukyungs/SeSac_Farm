//
//  Observable.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import Foundation

class Observable<T> {
    private var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}


//
//  APIService.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/04.
//

import UIKit

enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
}

class APIService {
    
    
    
    // 회원가입
    static func signUp(email: String, username: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
        
//        let url = URL(string: "http://test.monocoding.com:1231/auth/local/register")!
        
        var request = URLRequest(url: Endpoint.signup.url)
        
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "email=\(email)&username=\(username)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
       
        
        // 수정 버전
        URLSession.request(endpoint: request, completion: completion)
        
        
    }
    
    // 로그인
    
    static func signIn(identifier: String, password: String, completion: @escaping (User?, APIError?) -> Void) {
        
        var request = URLRequest(url: Endpoint.signin.url)
        request.httpMethod = Method.POST.rawValue
        
        request.httpBody = "identifier=\(identifier)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.request(endpoint: request, completion: completion)

    }
    
    
    // 포스트 조회
    
    static func getPosts(token: String, completion: @escaping (Posts?, APIError?) -> Void) {
        
        var request = URLRequest(url: Endpoint.getPosts.url)
        request.httpMethod = Method.GET.rawValue
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.request(endpoint: request, completion: completion)
    }
    
    
    // 포스트 글 작성
    
    static func writePost(token: String, text: String, completion: @escaping (Post?, APIError?) -> Void) {
        
        var request = URLRequest(url: Endpoint.writePost.url)
        
        request.httpMethod = Method.POST.rawValue
        request.httpBody = "text=\(text)".data(using: .utf8, allowLossyConversion: false)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.request(endpoint: request, completion: completion)
        
    }
    
    // 한개의 포스트 디테일 보기 [comment 부분]
    
    static func detailPost(token: String, postId: Int, completion: @escaping (Post?, APIError?) -> Void) {

        let url = Endpoint.detailPost(postId: postId).url
        var request = URLRequest(url: url)

        request.httpMethod = Method.GET.rawValue
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.request(endpoint: request, completion: completion)

    }
    
    // comment 부분
    
    static func commentsView(token: String, postId: Int, completion: @escaping (Comments?, APIError?) -> Void) {
        
        let url = Endpoint.getComment(postId: postId).url
        var request = URLRequest(url: url)
        
        request.httpMethod = Method.GET.rawValue
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.request(endpoint: request, completion: completion)
        
        
    }
}

















/*
URLSession.shared.dataTask(with: request) { data, response, error in
    
    guard error == nil else {
        completion(nil, .failed)
        return
    }
    
    guard let data = data else {
        completion(nil, .noData)
        return
    }
    
    guard let response = response as? HTTPURLResponse else {
        completion(nil, .invalidResponse)
        return
    }
    
    guard response.statusCode == 200 else {
        completion(nil, .failed)
        return
    }
    
    do {
        let decoder = JSONDecoder()
        let userData = try decoder.decode(User.self, from: data)
        completion(userData, nil)
    } catch {
        completion(nil, .invalidData)
    }

}.resume()
*/

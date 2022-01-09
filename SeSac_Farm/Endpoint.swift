//
//  Endpoint.swift
//  SeSac_Farm
//
//  Created by 이주경 on 2022/01/05.
//

import Foundation

enum Method: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum Endpoint {
    case signup
    case signin
    case getPosts
    case writePost
    case detailPost(postId: Int)
    case getComment(postId: Int)
}

extension Endpoint {
    var url: URL {
        switch self {
        case .signup: return .makeEndpoint("auth/local/register")
        case .signin: return .makeEndpoint("auth/local")
        case .getPosts: return .makeEndpoint("posts?_sort=created_at:desc")
        case .writePost: return .makeEndpoint("posts")
        case .detailPost(postId: let postId): return .makeEndpoint("posts/\(postId)")
        case .getComment(postId: let postId): return .makeEndpoint("comments?post=\(postId)")
           
        }
    }
}

extension URL {
    static let baseURL = "http://test.monocoding.com:1231/"

    static func makeEndpoint(_ endpoint: String) -> URL {
        URL(string: baseURL + endpoint)!
    }
}


extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func dataTask(_ endpoint: URLRequest, handler: @escaping Handler) -> URLSessionDataTask {
        
        let task = dataTask(with: endpoint, completionHandler: handler)
        task.resume()
        return task
    }
    
    static func request<T: Decodable>(_ session: URLSession = .shared, endpoint: URLRequest, completion: @escaping (T?, APIError?) -> Void) {
        
        session.dataTask(endpoint) { data, response, error in
            
            DispatchQueue.main.async {
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
                    let userData = try decoder.decode(T.self, from: data)
                    completion(userData, nil)
                } catch {
                    completion(nil, .invalidData)
                }
            }
            
        }
    }
}

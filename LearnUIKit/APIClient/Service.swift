//
//  Service.swift
//  LearnUIKit
//
//  Created by Duc Do on 24/05/2023.
//

import Foundation

final class Service {
    static let shared = Service()
    
    private init() {}
    
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func exec<T: Codable>(_ request: Request, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(type.self, from: data)
                
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func request(from request: Request) -> URLRequest? {
        guard let url = request.url else {return nil}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        return request
        
    }
    
}

//
//  Request.swift
//  LearnUIKit
//
//  Created by Duc Do on 24/05/2023.
//

import Foundation

final class Request {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    let endpoint: Endpoint
    
    private let pathComponents: [String]
    
    private let queryParams: [URLQueryItem]
    
    public var url: URL? {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParams.isEmpty {
            string += "?"
            let argsString = queryParams.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argsString
        }
        
        guard let result = URL(string: string) else {
            return nil
        }
        
        return result
    }
    
    public init(endpoint: Endpoint, pathComponents: [String] = [], queryParams: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
    
    convenience init?(url: URL) {
          let string = url.absoluteString
          if !string.contains(Constants.baseUrl) {
              return nil
          }
          let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
          if trimmed.contains("/") {
              let components = trimmed.components(separatedBy: "/")
              if !components.isEmpty {
                  let endpointString = components[0] // Endpoint
                  var pathComponents: [String] = []
                  if components.count > 1 {
                      pathComponents = components
                      pathComponents.removeFirst()
                  }
                  if let endpoint = Endpoint(
                      rawValue: endpointString
                  ) {
                      self.init(endpoint: endpoint, pathComponents: pathComponents)
                      return
                  }
              }
          } else if trimmed.contains("?") {
              let components = trimmed.components(separatedBy: "?")
              if !components.isEmpty, components.count >= 2 {
                  let endpointString = components[0]
                  let queryItemsString = components[1]
                  // value=name&value=name
                  let queryParams: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                      guard $0.contains("=") else {
                          return nil
                      }
                      let parts = $0.components(separatedBy: "=")

                      return URLQueryItem(
                          name: parts[0],
                          value: parts[1]
                      )
                  })

                  if let endpoint = Endpoint(rawValue: endpointString) {
                      self.init(endpoint: endpoint, queryParams: queryParams)
                      return
                  }
              }
          }

          return nil
      }
}

extension Request {
    static let listCharactersRequests = Request(endpoint: .character)
}

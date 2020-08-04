//
//  Network.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void

class Network {
    static func requestConnection(request: URLRequest,
                                  completion: @escaping (Response<Data, Error>) -> Void) {
        
        
        let networkCompletionHandler: NetworkCompletionHandler = { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode.isSuccessHTTPCode else { return }
            
            switch (data, error) {
            case(let data?, _): completion(.Success(data))
            case(_, let error?): completion(.Failure(error))
            default: break
            }
        }
        URLSession.shared.dataTask(with: request, completionHandler: networkCompletionHandler).resume()
    }
}

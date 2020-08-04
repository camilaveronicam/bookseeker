//
//  NetworkLayer.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import Foundation

typealias CompletionHandler = (Response<Data, Error>) -> Void
typealias ErrorHandler = (NetworkError) -> Void

class APIRequest {
    
    func get<T: Decodable>(urlString: String,
                                successHandler: @escaping (T) -> Void,
                                errorHandler: @escaping ErrorHandler) {
            
            let completionHandler: CompletionHandler = { (response) in
                print (response)
                switch response {
                    
                case .Success(let data):
                    
                    let result: Response<T,Error> = decodeData(data: data)
                    
                    switch result {
                        
                    case .Success(let data):
                        
                        successHandler(data)
                        
                    case .Failure(let error):
                        
                        errorHandler(NetworkError(error: error))
                    }
                    
                case .Failure(let error):
                    
                    errorHandler(NetworkError(error: error))
                    
                }
            }
            
            
            
            guard let url = URL(string: urlString) else {
                        return errorHandler(NetworkError(error:"Unable to create URL from given string" as! Error))
                    }
            
                    var request = URLRequest(url: url)
                    request.httpMethod = HTTPMethod.get.rawValue
                    request.cachePolicy = .reloadIgnoringLocalCacheData
                    Network.requestConnection(request:request, completion: completionHandler)
     
    }
        
}

internal func decodeData<T:Decodable>(data: Data) -> Response<T, Error> {

    do {
        
        let result = try JSONDecoder().decode(T.self, from: data)
        return .Success(result)
    
    } catch {
        print("error trying to convert data to JSON")
        print(error)
        
        return .Failure(error)
    }
    
    
}


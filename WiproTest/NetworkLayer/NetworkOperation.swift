//
//  NetworkOperation.swift
//  WiproTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//


import Foundation

/// - Parameters:
///     - urlRequest:  *urlRequest* create the request.


/// -CompletionBlock : after service call return

///           -result :  *result*  returnt data.
///           -response : *response* returen status code.
///           -error   : *error*  return error message.

/// URLSession framework used to call websewrvice.

class NetworkOperation {
    typealias CompletionBlock = (_ result: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    static func executeNetworkRequest(_ urlRequest: URLRequest, completion: @escaping CompletionBlock) {
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            debugPrint("""
                Data: \(String(describing: data)) \n
                Reponse: \(String(describing: response))
                Error: \(String(describing: error))
                """)
            
            if let data = data
            {
                let stringValue = String(decoding: data, as: UTF8.self)
                let dataValue = Data(stringValue.utf8)
                completion(dataValue, response, error)
            }

        }
        
        dataTask.resume()
    }
}

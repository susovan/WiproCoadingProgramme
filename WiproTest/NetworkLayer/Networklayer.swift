//
//  Networklayer.swift
//  WiproCodingTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import Foundation
class NetworkLayer {
    
    typealias reportCompletion = (_ reports:Data?) -> Void

    static func executeRequest(_ urlRequest: URLRequest, completion: @escaping reportCompletion) {
        NetworkOperation.executeNetworkRequest(urlRequest) { (data, response, error) in
            if nil != error {
//                Utility.showMessage(title:"Error",msg:error!.localizedDescription)
                return
            }
            guard nil != data else {
               return completion(nil)
            }
            guard response != nil else{
                return completion(nil)
            }
         let response = response as? HTTPURLResponse
            if response?.statusCode  == 200
            {
                completion(data)
            }else
            {
                _ = error?.localizedDescription ?? Constants.errorMessage
//                Utility.showMessage(title:"No Access", msg:errorMessage)
                return completion(nil)
            }

        }
    }
}







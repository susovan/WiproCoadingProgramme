//
//  RequestBuilder.swift
//  WiproTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import Foundation


class RequestBuilder {
    
    class func getRequestForAddress(_ address: String,
                                    parameters:[AnyHashable: Any]? = nil,
                                    httpBody: Data? = nil,
                                    httpType: HTTPMethod? = HTTPMethod.get) -> URLRequest? {
        if let url = URL(string: address) {
            var request = URLRequest(url: url)
            request.httpMethod = nil != httpType ? httpType!.rawValue : HTTPMethod.get.rawValue // can this be read from argument as non-nil
            request.setValue(Constants.applicationJson, forHTTPHeaderField: Constants.contentType)
            request.httpBody = httpBody
            nil != parameters ? request.httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
                : debugPrint("Parameters is nil")
            return request
        }
        return nil
    }
}

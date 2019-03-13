//
//  ServiceRequestLayer.swift
//  WiproTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import Foundation
class serviceRequest
    
{
    typealias tableContentDetails = (_ events:[ContentDetailsModel]) -> Void

    static func getContentDetails(complition: @escaping tableContentDetails)
    {
        let search = Constants.jsonUrl
        
        if  let request  = RequestBuilder.getRequestForAddress(search, parameters:nil, httpBody:nil, httpType:HTTPMethod.get)
        {
            NetworkLayer.executeRequest(request) { (data) in
                let jsonData = JSON(data as Any)
                let getallEvent = ContentDetailsModel.initiateWithJson(jsonObject:jsonData)
                if getallEvent.count > 0
                {
                    complition (getallEvent)
                }else
                {
                    return  complition (getallEvent)
                }
            }
        }
    }
}

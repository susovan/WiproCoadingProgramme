//
//  ContentDetailsModel.swift
//  WiproCodingTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import UIKit

class ContentDetailsModel: NSObject {

    var headerTitel :String?
    var title :String?
    var descriptionDetails :String?
    var imageHref: String?


    public static func initiateWithJson (jsonObject : JSON) -> [ContentDetailsModel]
    {
        var contentDetailModels = [ContentDetailsModel]()

        if jsonObject.count > 0
        {
            
            let contentDetails = jsonObject["rows"].arrayValue
            for  iteamDetails in  contentDetails {
                let tableContent = ContentDetailsModel()
                tableContent.title = iteamDetails ["title"].string
                tableContent.descriptionDetails =  iteamDetails ["description"].string
                tableContent.imageHref = iteamDetails ["imageHref"].stringValue
                contentDetailModels.append(tableContent)
            }
        }
        return contentDetailModels
    }
}



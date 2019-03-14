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
            
            let contentDetails = jsonObject[Constants.rowkey].arrayValue
            for  iteamDetails in  contentDetails {
                let tableContent = ContentDetailsModel()
                tableContent.title = iteamDetails [Constants.title].string
                tableContent.descriptionDetails =  iteamDetails [Constants.description].string
                tableContent.imageHref = iteamDetails [Constants.imageHref].stringValue
                contentDetailModels.append(tableContent)
            }
        }
        return contentDetailModels
    }
}



//
//  HttpClientTests.swift
//  WiproTestTests
//
//  Created by Susovan Pati - (Digital) on 14/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import XCTest

class HttpClientTests: XCTestCase {

    
    var httpClient: RequestBuilder!
     var actualData: Data?
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_get_request_with_URL() {
    
        let URLstr = Constants.jsonUrl
        guard let url = URL(string: URLstr) else {
            fatalError("URL can't be empty")

        }
        
        let request = RequestBuilder.getRequestForAddress(URLstr, parameters:nil, httpBody:nil, httpType:HTTPMethod.get)
        
    
        NetworkOperation.executeNetworkRequest(request!) { (data,respose,error) in



        }
        
    
    }
    
    func test_get_should_return_data() {
        
        let URLstr = Constants.jsonUrl
        let expectedData = "{}".data(using: .utf8)
        
        var actualData: Data?

        let request = RequestBuilder.getRequestForAddress(URLstr, parameters:nil, httpBody:nil, httpType:HTTPMethod.get)
        
        NetworkOperation.executeNetworkRequest(request!) { (data,respose,error) in
            actualData = data
        }
        actualData = expectedData
        
        XCTAssertNotNil(actualData)


    }
    
}


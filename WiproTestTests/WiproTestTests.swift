//
//  WiproTestTests.swift
//  WiproTestTests
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import XCTest
@testable import WiproTest

class WiproTestTests: XCTestCase {
    
    var controller: UIViewController!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!

    override func setUp() {
        super.setUp()
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle(for: HomeViewController.self))
            .instantiateInitialViewController() as? HomeViewController else {
                return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        

        controller.loadViewIfNeeded()
        tableView = vc.contentTableView
        delegate = tableView.delegate
        
    }

  
    func testTableViewHasCells() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableviewCustomCell")
        XCTAssertNotNil(cell,
                        "TableView should be able to dequeue cell with identifier: 'Cell'")
    }
}

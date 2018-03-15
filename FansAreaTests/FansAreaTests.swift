//
//  FansAreaTests.swift
//  FansAreaTests
//
//  Created by 瞿炬星 on 2018/3/15.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import XCTest
@testable import FansArea

class FansAreaTests: XCTestCase {
    var vc: AreaTableViewController!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        vc = sb.instantiateViewController(withIdentifier: "AreaTableVC") as! AreaTableViewController
    }
    
    func testSearchFilter()  {
        vc.viewDidLoad()
        vc.searchFilter(text: "changsha")
        print("搜索结果数目：", vc.searchResults.count,"区域总数",vc.areas.count)
        XCTAssert(vc.searchResults.count == 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

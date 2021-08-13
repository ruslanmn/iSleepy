//
//  iSleepyTests.swift
//  iSleepyTests
//
//  Created by 19079884 on 15.05.2021.
//

import XCTest
@testable import iSleepy

class iSleepyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let url = URL(string: TitleDataSource.TITLES_PAGE + "Chloroform")!
        let jsonResponse = try String(contentsOf: url)
        print(jsonResponse)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

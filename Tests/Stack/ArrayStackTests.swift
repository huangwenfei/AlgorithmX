//
//  ArrayStackTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/14.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class ArrayStackTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCountEmpty() throws {
        /// init()
        let link = ArrayStack<Any>()
        XCTAssertTrue(link.count == 0)
        XCTAssertTrue(link.isEmpty)
        XCTAssertTrue(link.lineDescription == "[]")
        /// init(_ elements: [Element])
        let link1 = ArrayStack([1, 2, 3, 4])
        XCTAssertTrue(link1.count == 4)
        XCTAssertFalse(link1.isEmpty)
        XCTAssertTrue(link1.lineDescription == "[1, 2, 3, 4]")
    }
    
    func intLink() -> ArrayStack<Int> {
        .init(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    }
    
    func testClear() throws {
        /// mutating func clear()
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertFalse(link.isEmpty)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        ///
        link.clear()
        XCTAssertTrue(link.count == 0)
        XCTAssertTrue(link.isEmpty)
        XCTAssertTrue(link.lineDescription == "[]")
    }
    
    func testPush() throws {
        /// mutating func push(_ element: Element)
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        link.push(11)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11]")
    }
    
    func testPeek() throws {
        /// var peek: Element? { get }
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(link.peek == 9)
        link.push(11)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11]")
        XCTAssertTrue(link.peek == 11)
    }
    
    func testPop() throws {
        /// mutating func pop() -> Element?
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(link.peek == 9)
        link.pop()
        XCTAssertTrue(link.count == 9)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8]")
        XCTAssertTrue(link.peek == 8)
        XCTAssertTrue(link.pop() == 8)
    }
    
    func testCombine() throws {
        /// static func + (lhs: Self, rhs: Self) -> Self
        let link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertTrue(link.lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        let link1 = ArrayStack([33, 22, 14, 11])
        XCTAssertTrue(link1.count == 4)
        XCTAssertTrue(link1.lineDescription == "[33, 22, 14, 11]")
        XCTAssertTrue((link + link1).lineDescription == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 33, 22, 14, 11]")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

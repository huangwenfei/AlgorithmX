//
//  StackQueueTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/14.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class StackQueueTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCountEmpty() throws {
        /// init()
        let queue = QueueStack<Any>()
        XCTAssertTrue(queue.count == 0)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertTrue(queue.description == "[]")
        /// init(_ elements: [Element])
        let queue1 = QueueStack([1, 2, 3, 4, 5, 7])
        XCTAssertTrue(queue1.count == 6)
        XCTAssertFalse(queue1.isEmpty)
        XCTAssertTrue(queue1.description == "[1, 2, 3, 4, 5, 7]")
    }
    
    func intQueue() -> QueueStack<Int> {
        .init(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    }
    
    func testClear() throws {
        /// func clear()
        var queue = intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        ///
        queue.clear()
        XCTAssertTrue(queue.count == 0)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertTrue(queue.description == "[]")
    }
    
    func testEnqueue() throws {
        /// func enqueue(_ element: Element) -> Bool
        var queue =  QueueStack<Int>()
        queue.enqueue(11)
        XCTAssertTrue(queue.count == 1)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[11]")
        let elements = [2, 3, 4, 5, 1, 4]
        queue.enqueue(elements: elements)
        XCTAssertTrue(queue.count == 1 + elements.count)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[11, 2, 3, 4, 5, 1, 4]")
    }
    
    func testPeek() throws {
        /// var peek: Element? { get }
        var queue =  intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.peek == 0)
        queue.enqueue(11)
        XCTAssertTrue(queue.count == 11)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11]")
        XCTAssertTrue(queue.peek == 0)
    }
    
    func testDequeue() throws {
        /// func dequeue() -> Element?
        var queue =  intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.peek == 0)
        queue.dequeue()
        XCTAssertTrue(queue.count == 9)
        XCTAssertTrue(queue.description == "[1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.peek == 1)
        XCTAssertTrue(queue.dequeue() == 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

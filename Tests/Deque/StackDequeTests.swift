//
//  StackDequeTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/15.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class StackDequeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCountEmpty() throws {
        /// init()
        let queue = DequeStack<Any>()
        XCTAssertTrue(queue.count == 0)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertTrue(queue.description == "[]")
        /// init(_ elements: [Element])
        let queue1 = DequeStack([1, 2, 3, 4, 5, 7])
        XCTAssertTrue(queue1.count == 6)
        XCTAssertFalse(queue1.isEmpty)
        XCTAssertTrue(queue1.description == "[1, 2, 3, 4, 5, 7]")
    }
    
    func intQueue() -> DequeStack<Int> {
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
    
    func testEnqueueFront() throws {
        /// func enqueue(front element: Element) -> Bool
        var queue =  DequeStack<Int>()
        queue.enqueue(front: 11)
        XCTAssertTrue(queue.count == 1)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[11]")
        let elements = [2, 3, 4, 5, 1, 4]
        queue.enqueue(fronts: elements)
        XCTAssertTrue(queue.count == 1 + elements.count)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[4, 1, 5, 4, 3, 2, 11]")
    }
    
    func testEnqueueRear() throws {
        /// func enqueue(rear element: Element) -> Bool
        var queue =  DequeStack<Int>()
        queue.enqueue(rear: 11)
        XCTAssertTrue(queue.count == 1)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[11]")
        let elements = [2, 3, 4, 5, 1, 4]
        queue.enqueue(rears: elements)
        XCTAssertTrue(queue.count == 1 + elements.count)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertTrue(queue.description == "[11, 2, 3, 4, 5, 1, 4]")
    }
    
    func testFront() throws {
        /// var front: Element? { get }
        var queue =  intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.front == 0)
        queue.enqueue(front: 11)
        XCTAssertTrue(queue.count == 11)
        XCTAssertTrue(queue.description == "[11, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.front == 11)
    }

    func testRear() throws {
        /// var rear: Element? { get }
        var queue =  intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.rear == 9)
        queue.enqueue(rear: 11)
        XCTAssertTrue(queue.count == 11)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11]")
        XCTAssertTrue(queue.rear == 11)
    }
    
    func testDequeueFront() throws {
        /// func dequeueFront() -> Element?
        var queue =  intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.front == 0)
        queue.dequeueFront()
        XCTAssertTrue(queue.count == 9)
        XCTAssertTrue(queue.description == "[1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.front == 1)
        XCTAssertTrue(queue.dequeueFront() == 1)
    }
    
    func testDequeueRear() throws {
        /// func dequeueRear() -> Element?
        var queue =  intQueue()
        XCTAssertTrue(queue.count == 10)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
        XCTAssertTrue(queue.rear == 9)
        queue.dequeueRear()
        XCTAssertTrue(queue.count == 9)
        XCTAssertTrue(queue.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8]")
        XCTAssertTrue(queue.rear == 8)
        XCTAssertTrue(queue.dequeueRear() == 8)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

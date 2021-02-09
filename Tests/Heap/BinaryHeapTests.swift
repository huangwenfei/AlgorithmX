//
//  BinaryHeapTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/15.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class BinaryHeapTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCountEmpty() throws {
        /// init(comparator: @escaping (_ lhs: Element, _ rhs: Element) -> Bool)
        /// init(elements: [Element], comparator: @escaping (_ lhs: Element, _ rhs: Element) -> Bool)
        let heap = BinaryHeap<Int> { $0 < $1 }
        XCTAssertTrue(heap.count == 0)
        XCTAssertTrue(heap.isEmpty)
        XCTAssertTrue(heap.description == "[]")
        /// var count: Int { get }
        let heap1 = BinaryHeap<Double>(elements: [1.4, 22.8, 22.4, 12.3, 0.6, 0.4, 45.3, 21.3]) { $0 > $1 }
        XCTAssertTrue(heap1.count == 8)
        XCTAssertFalse(heap1.isEmpty)
        XCTAssertTrue(heap1.description == "[45.3, 22.8, 22.4, 21.3, 0.6, 0.4, 1.4, 12.3]")
        ///
        let heap2 = BinaryHeap<Double>(elements: [1.4, 22.8, 22.4, 12.3, 0.6, 0.4, 45.3, 21.3]) { $0 < $1 }
        XCTAssertTrue(heap2.count == 8)
        XCTAssertFalse(heap2.isEmpty)
        XCTAssertTrue(heap2.description == "[0.4, 0.6, 1.4, 12.3, 22.8, 22.4, 45.3, 21.3]")
    }
    
    private func doubleMaxHeap() -> BinaryHeap<Double> {
        .init(elements: [1.4, 22.8, 22.4, 12.3, 0.6, 0.4, 45.3, 21.3]) {
            $0 > $1
        }
    }
    
    private func doubleMinHeap() -> BinaryHeap<Double> {
        .init(elements: [1.4, 22.8, 22.4, 12.3, 0.6, 0.4, 45.3, 21.3]) {
            $0 < $1
        }
    }
    
    func testClear() throws {
        /// mutating func clear()
        var heap = doubleMaxHeap()
        heap.clear()
        XCTAssertTrue(heap.count == 0)
        XCTAssertTrue(heap.isEmpty)
        XCTAssertTrue(heap.description == "[]")
    }
    
    func testAdd() throws {
        /// mutating func add(element: Element)
        var heap = doubleMaxHeap()
        heap.add(element: 11.3)
        XCTAssertTrue(heap.count == 9)
        XCTAssertTrue(heap.description == "[45.3, 22.8, 22.4, 21.3, 0.6, 0.4, 1.4, 12.3, 11.3]")
        heap.add(element: 20.9)
        XCTAssertTrue(heap.count == 10)
        XCTAssertTrue(heap.description == "[45.3, 22.8, 22.4, 21.3, 20.9, 0.4, 1.4, 12.3, 11.3, 0.6]")
        /// mutating func add(elements: [Element])
        heap.add(elements: [111, 123, 87, 24, 15])
        XCTAssertTrue(heap.count == 15)
        XCTAssertTrue(heap.description == "[123.0, 45.3, 111.0, 21.3, 22.8, 87.0, 24.0, 12.3, 11.3, 0.6, 20.9, 0.4, 22.4, 1.4, 15.0]")
        /// mutating func add(element: Element)
        var heap1 = doubleMinHeap()
        heap1.add(element: 11.3)
        XCTAssertTrue(heap1.count == 9)
        XCTAssertTrue(heap1.description == "[0.4, 0.6, 1.4, 11.3, 22.8, 22.4, 45.3, 21.3, 12.3]")
        heap1.add(element: 20.9)
        XCTAssertTrue(heap1.count == 10)
        XCTAssertTrue(heap1.description == "[0.4, 0.6, 1.4, 11.3, 20.9, 22.4, 45.3, 21.3, 12.3, 22.8]")
        /// mutating func add(elements: [Element])
        heap1.add(elements: [111, 123, 87, 24, 15])
        XCTAssertTrue(heap1.count == 15)
        XCTAssertTrue(heap1.description == "[0.4, 0.6, 1.4, 11.3, 20.9, 22.4, 15.0, 21.3, 12.3, 22.8, 111.0, 123.0, 87.0, 45.3, 24.0]")
    }
    
    func testPeek() throws {
        /// var peek: Element? { get }
        var heap = doubleMaxHeap()
        heap.add(element: 112)
        XCTAssertTrue(heap.count == 9)
        heap.add(element: 20.9)
        XCTAssertTrue(heap.count == 10)
        XCTAssertTrue(heap.peek == 112)
        ///
        heap.add(elements: [111, 123, 87, 24, 15])
        XCTAssertTrue(heap.count == 15)
        XCTAssertTrue(heap.peek == 123)
        ///
        var heap1 = doubleMinHeap()
        heap1.add(element: 11.3)
        XCTAssertTrue(heap1.count == 9)
        XCTAssertTrue(heap1.peek == 0.4)
        heap1.add(element: 0.1)
        XCTAssertTrue(heap1.count == 10)
        XCTAssertTrue(heap1.peek == 0.1)
        ///
        heap1.add(elements: [10.2, 0.22, 0.1, 0.04, 1.8])
        XCTAssertTrue(heap1.count == 15)
        XCTAssertTrue(heap1.peek == 0.04)
    }
    
    func testRemove() throws {
        /// func remove() -> Element?
        var heap = doubleMaxHeap()
        var elements = [Double]()
        while let element = heap.remove() { elements.append(element) }
        XCTAssertTrue(elements.description == "[45.3, 22.8, 22.4, 21.3, 12.3, 1.4, 0.6, 0.4]")
        ///
        var heap1 = doubleMinHeap()
        elements = []
        while let element = heap1.remove() { elements.append(element) }
        XCTAssertTrue(elements.description == "[0.4, 0.6, 1.4, 12.3, 21.3, 22.4, 22.8, 45.3]")
    }
    
    func testReplace() throws {
        /// func replace(element: Element) -> Element?
        var heap = doubleMaxHeap()
        XCTAssertTrue(heap.replace(element: 11.3) == 45.3)
        XCTAssertTrue(heap.count == 8)
        XCTAssertTrue(heap.description == "[22.8, 21.3, 22.4, 12.3, 0.6, 0.4, 1.4, 11.3]")
        ///
        var heap1 = doubleMinHeap()
        XCTAssertTrue(heap1.replace(element: 11.3) == 0.4)
        XCTAssertTrue(heap1.count == 8)
        XCTAssertTrue(heap1.description == "[0.6, 11.3, 1.4, 12.3, 22.8, 22.4, 45.3, 21.3]")
    }
    
    func testReheap() throws {
        /// func reheap(byNewComparator new: @escaping (_ lhs: Element, _ rhs: Element) -> Bool)
        var heap = doubleMaxHeap()
        heap.reheap { $0 < $1 }
        XCTAssertTrue(heap.description == "[0.4, 0.6, 1.4, 12.3, 22.8, 22.4, 45.3, 21.3]")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

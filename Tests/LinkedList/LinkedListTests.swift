//
//  LinkedListTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/13.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class LinkedListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCountEmpty() throws {
        /// case 1
        let link = LinkedList<Any>()
        XCTAssertTrue(link.count == 0)
        XCTAssertTrue(link.isEmpty)
        XCTAssertTrue(link.description == "[]")
        /// case 2
        let link1 = LinkedList([2, 5 ,8])
        XCTAssertTrue(link1.count == 3)
        XCTAssertFalse(link1.isEmpty)
        XCTAssertTrue(link1.description == "[2, 5, 8]")
        /// case 3
        let link2 = LinkedList(arrayLiteral: "7", "676", "gh", "")
        XCTAssertTrue(link2.count == 4)
        XCTAssertFalse(link2.isEmpty)
        XCTAssertTrue(link2.description == String("[\"7\", \"676\", \"gh\", \"\"]"))
    }
    
    func intLink() -> LinkedList<Int> {
        .init(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    }
    
    func testClear() throws {
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertFalse(link.isEmpty)
        link.clear()
        XCTAssertTrue(link.count == 0)
        XCTAssertTrue(link.isEmpty)
    }
    
    func testContains() throws {
        /// func contains(where predicate: (_ element: Element) -> Bool) -> Bool
        let link = intLink()
        XCTAssertTrue(link.contains { $0 == 6 })
        XCTAssertFalse(link.contains { $0 == 90 })
        XCTAssertTrue(link.isContains(5))
        XCTAssertFalse(link.isContains(56))
    }
    
    func testPush() throws {
        /// func push(element: Element)
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertFalse(link.isEmpty)
        ///
        link.push(element: 55)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.isContains(55))
        XCTAssertTrue(link.description == "[55, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
    }
    
    func testAppend() throws {
        /// func append(element: Element)
        var link = intLink()
        XCTAssertTrue(link.count == 10)
        XCTAssertFalse(link.isEmpty)
        ///
        link.append(element: 55)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.isContains(55))
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 55]")
        /// func append<S>(elements: S) where S: Sequence, S.Element == Self.Element
        link.append(elements: [45, 67, 7, 3])
        XCTAssertTrue(link.count == 11 + 4)
        XCTAssertTrue(link.isContains(45))
        XCTAssertTrue(link.isContains(67))
        XCTAssertTrue(link.isContains(7))
        XCTAssertTrue(link.isContains(3))
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 55, 45, 67, 7, 3]")
    }
    
    func testElement() throws {
        /// func element(AtIndex index: Int) -> Element?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        let link = intLink()
        XCTAssertTrue(link.element(AtIndex: 3) == 3)
        XCTAssertTrue(link.element(AtIndex: 7) == 7)
    }
    
    func testReplace() throws {
        /// func replace(element: Element, at index: Int) -> Element?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        link.replace(element: 66, at: 6)
        XCTAssertTrue(link.count == 10)
        XCTAssertTrue(link.isContains(66))
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 66, 7, 8, 9]")
        ///
        link.replace(element: 23, at: 9)
        XCTAssertTrue(link.count == 10)
        XCTAssertTrue(link.isContains(23))
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 66, 7, 8, 23]")
    }
    
    func testInsert() throws {
        /// func insert(element: Element, at index: Int)
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        link.insert(element: 555, at: 6)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 555, 6, 7, 8, 9]")
    }
    
    func testRemove() throws {
        /// func remove() -> Element?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        link.remove()
        XCTAssertTrue(link.count == 9)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8]")
        /// func remove(at index: Int) -> Element?
        link.remove(at: 7)
        XCTAssertTrue(link.count == 8)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 6, 8]")
    }
    
    func testPop() throws {
        /// func pop() -> Element?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        link.pop()
        XCTAssertTrue(link.count == 9)
        print(link)
        XCTAssertTrue(link.description == "[1, 2, 3, 4, 5, 6, 7, 8, 9]")
        link.pop()
        XCTAssertTrue(link.count == 8)
        XCTAssertTrue(link.description == "[2, 3, 4, 5, 6, 7, 8, 9]")
    }
    
    func testFirstIndex() throws {
        /// func firstIndex(where predicate: (_ element: Element) -> Bool) -> Int?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        XCTAssertTrue(link.firstIndex(of: 5)?.data == 5)
        XCTAssertTrue(link.firstIndex { $0 == 7 } == 7)
        link.insert(element: 5, at: 3)
        XCTAssertTrue(link.firstIndex { $0 == 5 } == 3)
    }
    
    func testLastIndex() throws {
        /// func lastIndex(where predicate: (_ element: Element) -> Bool) -> Int?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        XCTAssertTrue(link.lastIndex { $0 == 7 } == 7)
        link.insert(element: 5, at: 3)
        XCTAssertTrue(link.lastIndex { $0 == 5 } == 6)
    }
    
    func testRemix() {
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        /// insert
        link.insert(element: 55, at: 6)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 55, 6, 7, 8, 9]")
        link.insert(element: 12, at: 3)
        XCTAssertTrue(link.count == 12)
        XCTAssertTrue(link.description == "[0, 1, 2, 12, 3, 4, 5, 55, 6, 7, 8, 9]")
        /// replace
        link.replace(element: 4, at: 4)
        link.replace(element: 76, at: link.lastIndex { $0 == 8 }!)
        XCTAssertTrue(link.count == 12)
        XCTAssertTrue(link.description == "[0, 1, 2, 12, 4, 4, 5, 55, 6, 7, 76, 9]")
        /// pop
        var pops = [Int]()
        let breakPoint = 3
        for _ in 0 ..< breakPoint { pops.append(link.pop()!) }
        XCTAssertTrue(pops.description == "[0, 1, 2]")
        XCTAssertTrue(link.count == 12 - 3)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9]")
        /// element
        XCTAssertTrue(link.element(AtIndex: 40) == nil)
        XCTAssertTrue(link.element(AtIndex: 4) == 55)
        XCTAssertTrue(link.element(AtIndex: 7) == 76)
        /// append
        link.append(element: 66)
        XCTAssertTrue(link.count == 12 - 3 + 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66]")
        link.append(element: 44)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44]")
        link.append(elements: [7, 4, 33, 132, 78])
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33, 132, 78]")
        /// remove
        XCTAssertTrue(link.remove() == 78)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33, 132]")
        link.remove()
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33]")
        /// isContains
        XCTAssertFalse(link.isContains(666))
        XCTAssertTrue(link.isContains(6))
        let re = link.remove(at: 6)
        XCTAssertTrue(re == 7)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        /// push
        link.push(element: 666)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1 - 1 + 1)
        XCTAssertTrue(link.isContains(666))
        XCTAssertTrue(link.description == "[666, 12, 4, 4, 5, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        link.push(element: 690)
        XCTAssertTrue(link.count == 15)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        /// insert
        link.insert(element: 546, at: 6)
        XCTAssertTrue(link.count == 16)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        link.insert(element: 55, at: 9)
        XCTAssertTrue(link.count == 17)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 55, 6, 55, 76, 9, 66, 44, 7, 4, 33]")
        /// remove
        link.remove(at: 7)
        XCTAssertTrue(link.count == 16)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 9, 66, 44, 7, 4, 33]")
        link.remove(at: 10)
        XCTAssertTrue(link.count == 15)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 66, 44, 7, 4, 33]")
        /// push
        link.push(element: 555)
        XCTAssertTrue(link.count == 16)
        XCTAssertTrue(link.description == "[555, 690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 66, 44, 7, 4, 33]")
        /// pop
        link.pop()
        XCTAssertTrue(link.count == 15)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 66, 44, 7, 4, 33]")
        /// clear
        link.clear()
        XCTAssertTrue(link.count == 0)
        XCTAssertTrue(link.description == "[]")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

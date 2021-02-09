//
//  SingleLinkedListNodableTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/14.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

final class Node<Element>: SingleLinkedListNodableProtocol {
    
    typealias Element = Element
    
    func setElement(_ element: Element?) {
        self.element = element
    }
    
    func getElement() -> Element? {
        element
    }
    
    func setNext(_ next: Node<Element>?) {
        self.next = next
    }
    
    func getNext() -> Node<Element>? {
        next
    }
    
    var element: Element?
    var next: Node<Element>?
    
    init(element: Element?) {
        self.element = element
        self.next = nil
    }
    
    init(element: Element?, next: Node<Element>?) {
        self.element = element
        self.next = next
    }
    
}

class SingleLinkedListNodableTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCountEmpty() throws {
        /// case 1
        let link = SingleLinkedListNodable<Node<Any>>()
        XCTAssertTrue(link.count == 0)
        XCTAssertTrue(link.isEmpty)
        XCTAssertTrue(link.description == "[]")
        /// case 2
        let link1 = SingleLinkedListNodable<Node>([2, 5 ,8])
        XCTAssertTrue(link1.count == 3)
        XCTAssertFalse(link1.isEmpty)
        XCTAssertTrue(link1.description == "[2, 5, 8]")
        /// case 3
        let link2 = SingleLinkedListNodable<Node>(arrayLiteralElement: "7", "676", "gh", "")
        XCTAssertTrue(link2.count == 4)
        XCTAssertFalse(link2.isEmpty)
        XCTAssertTrue(link2.description == String("[\"7\", \"676\", \"gh\", \"\"]"))
        /// case 4
        let link3 = SingleLinkedListNodable([Node(element: 1), .init(element: 4), .init(element: 6)])
        XCTAssertTrue(link3.count == 3)
        XCTAssertFalse(link3.isEmpty)
        XCTAssertTrue(link3.description == "[1, 4, 6]")
    }
    
    func intLink() -> SingleLinkedListNodable<Node<Int>> {
        .init(arrayLiteralElement: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    }
    
    func intNodeLink() -> (SingleLinkedListNodable<Node<Int>>, [Node<Int>]) {
        var nodes = [Node<Int>]()
        for idx in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] {
            nodes.append(.init(element: idx))
        }
        return (.init(nodes), nodes)
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
        ///
        let link1 = intNodeLink()
        let n = Node(element: 90)
        XCTAssertTrue(link1.0.contains { $0 === link1.1[4] })
        XCTAssertFalse(link1.0.contains { $0 === n })
        XCTAssertTrue(link1.0.isContains(link1.1[4]))
        XCTAssertFalse(link1.0.isContains(n))
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
        ///
        var link1 = intNodeLink()
        XCTAssertTrue(link1.0.count == 10)
        XCTAssertFalse(link1.0.isEmpty)
        ///
        let n = Node(element: 55)
        link1.0.push(node: n)
        XCTAssertTrue(link1.0.count == 11)
        XCTAssertTrue(link1.0.isContains(n))
        XCTAssertTrue(link1.0.description == "[55, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]")
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
        ///
        var link1 = intNodeLink()
        XCTAssertTrue(link1.0.count == 10)
        XCTAssertFalse(link1.0.isEmpty)
        ///
        let n = Node(element: 55)
        link1.0.append(node: n)
        XCTAssertTrue(link1.0.count == 11)
        XCTAssertTrue(link1.0.isContains(n))
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 55]")
        /// func append<S>(nodes: S)
        let ns: [Node<Int>] = [.init(element: 45), .init(element: 67), .init(element: 7), .init(element: 3)]
        link1.0.append(nodes: ns)
        XCTAssertTrue(link1.0.count == 11 + 4)
        XCTAssertTrue(link1.0.isContains(ns[0]))
        XCTAssertTrue(link1.0.isContains(ns[1]))
        XCTAssertTrue(link1.0.isContains(ns[2]))
        XCTAssertTrue(link1.0.isContains(ns[3]))
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 55, 45, 67, 7, 3]")
    }
    
    func testElement() throws {
        /// func element(AtIndex index: Int) -> Element?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        let link = intLink()
        XCTAssertTrue(link.element(AtIndex: 3) == 3)
        XCTAssertTrue(link.element(AtIndex: 7) == 7)
        XCTAssertTrue(link.element(before: 3) == 2)
        XCTAssertTrue(link.element(after: 7) == 8)
        /// func node(AtIndex index: Int) -> Node?
        /// func node(before node: Node) -> Node?
        /// func node(after node: Node) -> Node?
        let link1 = intNodeLink()
        XCTAssertTrue(link1.0.node(AtIndex: 3) === link1.1[3])
        XCTAssertTrue(link1.0.node(AtIndex: 7) === link1.1[7])
        XCTAssertTrue(link1.0.node(before: link1.1[3]) === link1.1[2])
        XCTAssertTrue(link1.0.node(after: link1.1[3]) === link1.1[4])
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
        ///
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link1 = intNodeLink()
        let n = Node(element: 66)
        link1.0.replace(node: n, at: 6)
        XCTAssertTrue(link1.0.count == 10)
        XCTAssertTrue(link1.0.isContains(n))
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 4, 5, 66, 7, 8, 9]")
        ///
        let nn = Node(element: 77)
        link1.0.replace(node: link1.1[7], by: nn)
        XCTAssertTrue(link1.0.count == 10)
        XCTAssertTrue(link1.0.isContains(nn))
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 4, 5, 66, 77, 8, 9]")
    }
    
    func testInsert() throws {
        /// func insert(element: Element, at index: Int)
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        link.insert(element: 555, at: 6)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 555, 6, 7, 8, 9]")
        ///
        var link1 = intNodeLink()
        let n = Node(element: 555)
        link1.0.insert(node: n, at: 6)
        XCTAssertTrue(link1.0.count == 11)
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 4, 5, 555, 6, 7, 8, 9]")
        ///
        link1.0.insert(element: 77777, after: link1.1[7])
        XCTAssertTrue(link1.0.count == 12)
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 4, 5, 555, 6, 7, 77777, 8, 9]")
        ///
        let nn = Node(element: 8787)
        link1.0.insert(node: nn, after: link1.1[3])
        XCTAssertTrue(link1.0.count == 13)
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 3, 8787, 4, 5, 555, 6, 7, 77777, 8, 9]")
    }
    
    func testRemove() throws {
        /// func remove() -> Element?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        link.remove()
        XCTAssertTrue(link.count == 9)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 6, 7, 8]")
        /// func remove(at index: Int) -> Element?
        link.removeElement(at: 7)
        XCTAssertTrue(link.count == 8)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 6, 8]")
        ///
        var link1 = intNodeLink()
        link1.0.remove(node: link1.1[3])
        XCTAssertTrue(link1.0.count == 9)
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 4, 5, 6, 7, 8, 9]")
        link1.0.removeNode(at: 7)
        XCTAssertTrue(link1.0.count == 8)
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 4, 5, 6, 7, 9]")
        link1.0.remove(after: link1.1[4])
        XCTAssertTrue(link1.0.count == 7)
        XCTAssertTrue(link1.0.description == "[0, 1, 2, 4, 6, 7, 9]")
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
        XCTAssertTrue(link.firstIndex { $0 == 7 } == 7)
        link.insert(element: 5, at: 3)
        XCTAssertTrue(link.firstIndex { $0 == 5 } == 3)
        ///
        var link1 = intNodeLink()
        let n7 = link1.1[7]
        XCTAssertTrue(link1.0.firstIndex { $0 === n7 } == 7)
        let nn = Node(element: 5)
        link1.0.insert(node: nn, at: 3)
        XCTAssertTrue(link1.0.firstIndex { $0 === nn } == 3)
    }
    
    func testLastIndex() throws {
        /// func lastIndex(where predicate: (_ element: Element) -> Bool) -> Int?
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var link = intLink()
        XCTAssertTrue(link.lastIndex { $0 == 7 } == 7)
        link.insert(element: 5, at: 3)
        XCTAssertTrue(link.lastIndex { $0 == 5 } == 6)
        ///
        var link1 = intNodeLink()
        let n7 = link1.1[7]
        XCTAssertTrue(link1.0.lastIndex { $0 === n7 } == 7)
        let nn = link1.1[5]
        link1.0.insert(node: nn, at: 3)
        /**
                             ----------
                             |         |
         0 -> 1 -> 2 -> 5 -> 3 -> 4 -> 5 -> 6 ...
         */
        XCTAssertTrue(link1.0.lastIndex { $0 === nn } == 5)
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
        for _ in 0 ..< breakPoint { pops.append(link.pop()!.element!) }
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
        XCTAssertTrue(link.remove()?.element == 78)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33, 132]")
        link.remove()
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33]")
        /// isContains
        XCTAssertFalse(link.isContains(666))
        XCTAssertTrue(link.isContains(6))
        let re = link.removeElement(at: 6)
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
        link.removeElement(at: 7)
        XCTAssertTrue(link.count == 16)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 9, 66, 44, 7, 4, 33]")
        link.removeElement(at: 10)
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
    
    func testRemixNode() {
        /// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        var (link, nodes) = intNodeLink()
        /// insert
        var node = Node(element: 55)
        link.insert(node: node, at: 6)
        XCTAssertTrue(link.count == 11)
        XCTAssertTrue(link.description == "[0, 1, 2, 3, 4, 5, 55, 6, 7, 8, 9]")
        node = .init(element: 12)
        link.insert(node: node, at: 3)
        XCTAssertTrue(link.count == 12)
        XCTAssertTrue(link.description == "[0, 1, 2, 12, 3, 4, 5, 55, 6, 7, 8, 9]")
        /// replace
        node = .init(element: 4)
        link.replace(node: node, at: 4)
        node = .init(element: 76)
        link.replace(node: node, at: link.lastIndex { $0 == 8 }!)
        XCTAssertTrue(link.count == 12)
        XCTAssertTrue(link.description == "[0, 1, 2, 12, 4, 4, 5, 55, 6, 7, 76, 9]")
        /// pop
        var pops = [Int]()
        let breakPoint = 3
        for _ in 0 ..< breakPoint { pops.append(link.pop()!.element!) }
        XCTAssertTrue(pops.description == "[0, 1, 2]")
        XCTAssertTrue(link.count == 12 - 3)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9]")
        /// element
        XCTAssertTrue(link.element(AtIndex: 40) == nil)
        XCTAssertTrue(link.element(AtIndex: 4) == 55)
        XCTAssertTrue(link.element(AtIndex: 7) == 76)
        /// append
        node = .init(element: 66)
        link.append(node: node)
        XCTAssertTrue(link.count == 12 - 3 + 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66]")
        node = .init(element: 44)
        link.append(node: node)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44]")
        var append: [Node<Int>] = []
        for element in [7, 4, 33, 132, 78] {
            append.append(.init(element: element))
        }
        link.append(nodes: append)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33, 132, 78]")
        /// remove
        XCTAssertTrue(link.remove()?.element == 78)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33, 132]")
        link.remove()
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 7, 76, 9, 66, 44, 7, 4, 33]")
        /// isContains
        node = .init(element: 666)
        XCTAssertFalse(link.isContains(node))
        node = nodes[6]
        XCTAssertTrue(link.isContains(node))
        let re = link.removeNode(at: 6)
        XCTAssertTrue(re?.element == 7)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1 - 1)
        XCTAssertTrue(link.description == "[12, 4, 4, 5, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        /// push
        node = .init(element: 666)
        link.push(node: node)
        XCTAssertTrue(link.count == 12 - 3 + 1 + 1 + 5 - 1 - 1 - 1 + 1)
        XCTAssertTrue(link.isContains(node))
        XCTAssertTrue(link.description == "[666, 12, 4, 4, 5, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        node = .init(element: 690)
        link.push(node: node)
        XCTAssertTrue(link.count == 15)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        /// insert
        node = .init(element: 546)
        link.insert(node: node, at: 6)
        XCTAssertTrue(link.count == 16)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 55, 6, 76, 9, 66, 44, 7, 4, 33]")
        node = .init(element: 55)
        link.insert(node: node, at: 9)
        XCTAssertTrue(link.count == 17)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 55, 6, 55, 76, 9, 66, 44, 7, 4, 33]")
        /// remove
        link.removeNode(at: 7)
        XCTAssertTrue(link.count == 16)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 9, 66, 44, 7, 4, 33]")
        link.removeNode(at: 10)
        XCTAssertTrue(link.count == 15)
        XCTAssertTrue(link.description == "[690, 666, 12, 4, 4, 5, 546, 6, 55, 76, 66, 44, 7, 4, 33]")
        /// push
        node = .init(element: 555)
        link.push(node: node)
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

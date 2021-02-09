//
//  DequeLinkedList.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct DequeLinkedList<Element>: DequeProtocol {
    
    public typealias Element = Element
    
    private var list: LinkedList<Element>
    
    public init() {
        list = .init()
    }
    
    public init(_ elements: [Element]) {
        list = .init(elements)
    }
    
    public var count: Int { list.count }
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        list.clear()
    }
    
    public var front: Element? {
        list.head?.next?.element
    }

    public var rear: Element? {
        list.tail?.element
    }
    
    @discardableResult
    public mutating func enqueue(front element: Element) -> Bool {
        list.push(element: element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(fronts elements: [Element]) -> Bool {
        for element in elements { list.push(element: element) }
        return true
    }

    @discardableResult
    public mutating func enqueue(rear element: Element) -> Bool {
        list.append(element: element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(rears elements: [Element]) -> Bool {
        list.append(elements: elements)
        return true
    }

    @discardableResult
    public mutating func dequeueFront() -> Element? {
        list.pop()
    }
    
    @discardableResult
    public mutating func dequeueRear() -> Element? {
        list.remove()
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension DequeLinkedList {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension DequeLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        
        var node = list.head?.next
        while let next = node?.element {
            string += "\(next), "
            node = node?.next
        }
        
        return "[\((string == "" ? string : .init(string.dropLast(", ".count))))]"
    }
    
}

// MARK: - Sequence
extension DequeLinkedList {
    
    public struct Iterator: IteratorProtocol {
        
        private var head: LinkedList<Element>.Node?
        private var current: Int = 0
        
        fileprivate init(head: LinkedList<Element>.Node?) {
            self.head = head
        }
        
        public mutating func next() -> Element? {
            let next = head?.element
            head = head?.next
            return next
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(head: list.head)
    }
    
}

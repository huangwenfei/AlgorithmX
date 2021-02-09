//
//  DequeArray.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct DequeArray<Element>: DequeProtocol {
    
    public typealias Element = Element
    
    private var elements: [Element]
    
    public init() {
        elements = []
    }
    
    public init(_ elements: [Element]) {
        self.elements = elements
    }
    
    public var count: Int { elements.count }
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        elements = []
    }
    
    public var front: Element? {
        elements.first
    }

    public var rear: Element? {
        elements.last
    }
    
    @discardableResult
    public mutating func enqueue(front element: Element) -> Bool {
        elements.insert(element, at: 0)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(fronts elements: [Element]) -> Bool {
        for element in elements { self.elements.insert(element, at: 0) }
        return true
    }

    @discardableResult
    public mutating func enqueue(rear element: Element) -> Bool {
        elements.append(element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(rears elements: [Element]) -> Bool {
        self.elements.append(contentsOf: elements)
        return true
    }

    @discardableResult
    public mutating func dequeueFront() -> Element? {
        isEmpty ? nil : elements.removeFirst()
    }
    
    @discardableResult
    public mutating func dequeueRear() -> Element? {
        elements.popLast()
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension DequeArray {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension DequeArray: CustomStringConvertible {
    
    public var description: String { .init(describing: elements) }
    
}

// MARK: - Sequence
extension DequeArray {
    
    public struct Iterator: IteratorProtocol {
        
        private var elements: [Element]
        private var current: Int = 0
        
        fileprivate init(elements: [Element]) {
            self.elements = elements
        }
        
        public mutating func next() -> Element? {
            let next: Element? = (current == elements.count) ? nil : elements[current]
            current += 1
            return next
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(elements: elements)
    }
    
}

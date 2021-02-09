//
//  QueueArray.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct QueueArray<Element>: QueueProtocol {
    
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
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        elements.append(element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(elements: [Element]) -> Bool {
        for element in elements { enqueue(element) }
        return true
    }
    
    public var peek: Element? {
        elements.first
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        isEmpty ? nil : elements.removeFirst()
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension QueueArray {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension QueueArray: CustomStringConvertible {
    
    public var description: String { elements.description }
    
}

// MARK: - Sequence
extension QueueArray {
    
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

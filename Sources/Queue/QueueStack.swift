//
//  QueueStack.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

/**
 `-----------   -----------`
  D         `|  |`        E
            `|  |`
 `-----------   -----------`
 */
public struct QueueStack<Element>: QueueProtocol {
    
    public typealias Element = Element
    
    private var leftStack: ArrayStack<Element>
    private var rightStack: ArrayStack<Element>
    
    public init() {
        leftStack = []
        rightStack = []
    }
    
    public init(_ elements: [Element]) {
        leftStack = []
        rightStack = .init(elements)
    }
    
    public var count: Int { leftStack.count + rightStack.count }
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        leftStack = []
        rightStack = []
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        rightStack.push(element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(elements: [Element]) -> Bool {
        for element in elements { enqueue(element) }
        return true
    }
    
    public var peek: Element? {
        leftStack.isEmpty ? rightStack.reversed().first : leftStack.peek
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        if leftStack.isEmpty {
            var iter = rightStack.makeIterator()
            while let element = iter.next() { leftStack.push(element) }
            rightStack.clear()
        }
        return leftStack.pop()
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension QueueStack {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension QueueStack: CustomStringConvertible {
    
    public var description: String {
        (rightStack.reversed() + leftStack).description
    }
    
}

// MARK: - Sequence
extension QueueStack {
    
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
        .init(elements: leftStack.reversed() + rightStack)
    }
    
}

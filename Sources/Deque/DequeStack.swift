//
//  DequeStack.swift
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
 
 `-----------   -----------`
  E         `|  |`        D
            `|  |`
 `-----------   -----------`
 */
public struct DequeStack<Element>: DequeProtocol {
    
    public typealias Element = Element
    
    private var leftStack: ArrayStack<Element>
    private var rightStack: ArrayStack<Element>
    
    private var tempStack: ArrayStack<Element>
    
    public init() {
        leftStack = []
        rightStack = []
        tempStack = []
    }
    
    public init(_ elements: [Element]) {
        leftStack = []
        rightStack = .init(elements)
        tempStack = []
    }
    
    public var count: Int { leftStack.count + rightStack.count }
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        leftStack = []
        rightStack = []
        tempStack = []
    }
    
    public var front: Element? {
        leftStack.isEmpty ? rightStack.reversed().first : leftStack.peek
    }

    public var rear: Element? {
        rightStack.isEmpty ? leftStack.reversed().first : rightStack.peek
    }
    
    @discardableResult
    public mutating func enqueue(front element: Element) -> Bool {
        leftStack.push(element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(fronts elements: [Element]) -> Bool {
        for element in elements { leftStack.push(element) }
        return true
    }

    @discardableResult
    public mutating func enqueue(rear element: Element) -> Bool {
        rightStack.push(element)
        return true
    }
    
    @discardableResult
    public mutating func enqueue(rears elements: [Element]) -> Bool {
        for element in elements { rightStack.push(element) }
        return true
    }

    @discardableResult
    public mutating func dequeueFront() -> Element? {
        guard !leftStack.isEmpty else {
            var iter = rightStack.makeIterator()
            while let element = iter.next() { leftStack.push(element) }
            rightStack.clear()
            return leftStack.pop()
        }
        return leftStack.pop()
    }
    
    @discardableResult
    public mutating func dequeueRear() -> Element? {
        guard !rightStack.isEmpty else {
            var iter = leftStack.makeIterator()
            while let element = iter.next() { rightStack.push(element) }
            leftStack.clear()
            return rightStack.pop()
        }
        return rightStack.pop()
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension DequeStack {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension DequeStack: CustomStringConvertible {
    
    public var description: String {
        (leftStack + rightStack.reversed()).description
    }
    
}

// MARK: - Sequence
extension DequeStack {
    
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
        let stack = leftStack + rightStack
        var iterator = stack.makeIterator()
        var elements = [Element]()
        while let element = iterator.next() { elements.append(element) }
        return .init(elements: elements)
    }
    
}

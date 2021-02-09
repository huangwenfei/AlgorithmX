//
//  ArrayStack.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct ArrayStack<Element>: StackProtocol {

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
    
    public var peek: Element? { elements.last }
    
    public mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        elements.popLast()
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        .init(lhs.elements + rhs.elements)
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension ArrayStack {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension ArrayStack: CustomStringConvertible {
    
    public var lineDescription: String {
        elements.description
    }
    
    public var description: String {
        """
        ----top----
        \(elements.map { "\t\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
    
}

// MARK: - Sequence
extension ArrayStack {
    
    public struct Iterator: IteratorProtocol {
        
        private var elements: [Element]
        private var current: Int = 0
        
        fileprivate init(elements: [Element]) {
            self.elements = elements
            self.current = elements.count - 1
        }
        
        public mutating func next() -> Element? {
            let next: Element? = (current < 0) ? nil : elements[current]
            current -= 1
            return next
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(elements: elements)
    }
    
}

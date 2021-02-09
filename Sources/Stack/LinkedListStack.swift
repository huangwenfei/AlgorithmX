//
//  LinkdListStack.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct LinkdListStack<Element>: StackProtocol {
    
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
    
    public var peek: Element? { list.tail?.element }
    
    public mutating func push(_ element: Element) {
        list.append(element: element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        list.remove()
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        
        let elements: [Element] = .init(unsafeUninitializedCapacity: rhs.count) { (raw, count) in
            count = rhs.count
            var iterator = rhs.makeIterator()
            var idx = 0
            while let element = iterator.next() {
                raw[count - 1 - idx] = element
                idx += 1
            }
        }
        
        var lhs = lhs
        for element in elements { lhs.push(element) }
        
        return lhs
        
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension LinkdListStack {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension LinkdListStack: CustomStringConvertible {
    
    public var lineDescription: String {
        list.description
    }
    
    private func descriptionString() -> String {
        var string = ""
        
        var node = list.tail
        while let prev = node?.element {
            string += ("\t\(prev)" + "\n")
            node = node?.prev
        }
        
        return string
    }
    
    public var description: String {
        """
        ----top----
        \(descriptionString())
        -----------
        """
    }
    
}

// MARK: - Sequence
extension LinkdListStack {
    
    public struct Iterator: IteratorProtocol {
        
        private var tail: LinkedList<Element>.Node?
        private var current: Int = 0
        
        fileprivate init(tail: LinkedList<Element>.Node?) {
            self.tail = tail
        }
        
        public mutating func next() -> Element? {
            let next = tail?.element
            tail = tail?.prev
            return next
        }
    }
    
    public func makeIterator() -> Iterator {
        .init(tail: list.tail)
    }
    
}

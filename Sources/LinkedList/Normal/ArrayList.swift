//
//  ArrayList.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct ArrayList<Element>: ListProtocol {
    public typealias Element = Element
    
    private var elements: [Element] = []

    public init() { }
    
    public init<S>(_ elements: S) where S: Sequence, S.Element == Self.Element {
        self.elements = .init(elements)
    }
    
}

extension ArrayList: CustomStringConvertible {
    
    public var description: String { elements.description }
    
}

// MARK: - ListProtocol
extension ArrayList {
    
    public var count: Int { elements.count }
    
    public var isEmpty: Bool { elements.isEmpty }
    
    public mutating func clear() {
        elements = []
    }
   
    public func contains(where predicate: (_ element: Element) -> Bool) -> Bool {
        elements.contains(where: predicate)
    }
    
    public mutating func push(element: Element) {
        ensureCapacity(capacity: count + 1)
        elements.insert(element, at: startIndex)
    }
    
    public mutating func append(element: Element) {
        ensureCapacity(capacity: count + 1)
        elements.append(element)
    }
    
    public mutating func append<S>(elements: S) where S: Sequence, S.Element == Self.Element {
        for element in elements { append(element: element) }
    }
    
    public func element(AtIndex index: Int) -> Element? {
        guard icContainsIndex(index) else { return nil }
        return elements[index]
    }
    
    @discardableResult
    public mutating func replace(element: Element, at index: Int) -> Element? {
        guard icContainsIndex(index) else { return nil }
        
        let old = elements[index]
        elements[index] = element
        
        return old
    }
    
    public mutating func insert(element: Element, at index: Int) {
        guard icContainsIndex(index) else { return }
        ensureCapacity(capacity: count + 1)
        elements.insert(element, at: index)
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element? {
        guard icContainsIndex(index) else { return nil }
        let remove = elements.remove(at: index)
        trim()
        return remove
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        remove(at: 0)
    }
    
    @discardableResult
    public mutating func remove() -> Element? {
        remove(at: count - 1)
    }
    
    public func firstIndex(where predicate: (_ element: Element) -> Bool) -> Int? {
        elements.firstIndex(where: predicate)
    }
    
    public func lastIndex(where predicate: (_ element: Element) -> Bool) -> Int? {
        elements.lastIndex(where: predicate)
    }
    
}

extension ArrayList {
    
    public static var defaultCapacity: Int { 10 }
    
    /**
     * 保证要有capacity的容量
     * @param capacity
     */
    private mutating func ensureCapacity(capacity: Int) {
        let oldCapacity = elements.count
        guard oldCapacity >= capacity else { return }
        
        // 新容量为旧容量的1.5倍
        let newCapacity = oldCapacity + (oldCapacity >> 1)
        
        elements = .init(unsafeUninitializedCapacity: newCapacity) { (buffer, count) in
            count = oldCapacity
            for idx in 0 ..< count {
                buffer[idx] = elements[idx]
            }
        }
        
        #if DEBUG
        print(oldCapacity, " 扩容为 ", newCapacity)
        #endif
    }
    
    private mutating func trim() {

        let oldCapacity = elements.count
        
        let newCapacity = oldCapacity >> 1
        if (count > (newCapacity) || oldCapacity <= Self.defaultCapacity) { return }
        
        // 剩余空间还很多
        elements = .init(unsafeUninitializedCapacity: newCapacity) { (buffer, count) in
            count = oldCapacity
            for idx in 0 ..< count {
                buffer[idx] = elements[idx]
            }
        }
        
        #if DEBUG
        print(oldCapacity, " 扩容为 ", newCapacity)
        #endif
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension ArrayList {
    
    public init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
    
}

// MARK: - Collection
extension ArrayList {
    
    public typealias Index = Int
    
    public var startIndex: Index {
        0
    }
    
    public var endIndex: Index {
        count - 1
    }
    
    public func index(after i: Index) -> Index {
        i + 1
    }
    
    public subscript(position: Index) -> Element {
        element(AtIndex: position)!
    }
    
}

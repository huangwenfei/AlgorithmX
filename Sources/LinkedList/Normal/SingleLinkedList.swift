//
//  SingleLinkedList.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

// MARK: SingleLinkedList
public struct SingleLinkedList<Element>: ListProtocol {
    
    public typealias Element = Element
    public typealias Node = SingleLinkedListNode<Element>
    
    public var head: Node?
    public var tail: Node?
    
    public var count: Int
    
    public init() {
        head = .init(element: nil, next: nil)
        tail = head
        count = 0
    }
    
    public init<S>(_ elements: S) where S: Sequence, S.Element == Self.Element {
        self.init()
        append(elements: elements)
    }
    
}

extension SingleLinkedList: CustomStringConvertible {
    
    public var description: String {
        var elements = [Element]()
        var node = head?.next
        while let n = node?.element {
            elements.append(n)
            node = node?.next
        }
        return elements.description
    }
    
}

// MARK: - ListProtocol
extension SingleLinkedList {
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        referencedCheck()
        
        head?.next = nil
        tail = head
        count = 0
    }
   
    public func contains(where predicate: (_ element: Element) -> Bool) -> Bool {
        guard !isEmpty else { return false }
        
        var node: Node? = head
        while let element = node?.next?.element {
            if predicate(element) { return true }
            node = node?.next
        }
        
        return false
    }
    
    public mutating func push(element: Element) {
        referencedCheck()
        
        head?.next = .init(element: element, next: head?.next)
        
        if count == 0 { tail = head?.next }
        
        count += 1
    }
    
    public mutating func append(element: Element) {
        referencedCheck()
        
        guard !isEmpty else { push(element: element) ; return }
        
        tail?.next = .init(element: element)
        tail = tail?.next
        
        count += 1
    }
    
    public mutating func append<S>(elements: S) where S: Sequence, S.Element == Self.Element {
        for element in elements { append(element: element) }
    }
    
    public func element(AtIndex index: Int) -> Element? {
        node(AtIndex: index)?.element
    }
    
    @discardableResult
    public mutating func replace(element: Element, at index: Int) -> Element? {
        referencedCheck()
        
        guard icContainsIndex(index) else { return nil }
        
        let node = self.node(AtIndex: index)
        let old = node?.element
        node?.element = element
        
        return old
    }
    
    public mutating func insert(element: Element, at index: Int) {
        referencedCheck()
        
        guard !isEmpty else { push(element: element) ; return }
        
        guard index != 0 else { push(element: element) ; return }
        guard index != count - 1 else { append(element: element) ; return }
        
        let prev = node(AtIndex: index - 1)
        prev?.next = .init(element: element, next: prev?.next)

        count += 1
        
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element? {
        referencedCheck()
        
        guard icContainsIndex(index) else { return nil }
        
        guard !isEmpty else { return nil }
        
        guard index != 0 else { return pop() }
        guard index != count - 1 else { return remove() }
        
        let prev = self.node(AtIndex: index - 1)
        let node = prev?.next
        prev?.next = node?.next
        
        node?.next = nil
        
        count -= 1
        
        return node?.element
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        referencedCheck()
        
        guard !isEmpty else { return nil }
        
        let node = head?.next
        head?.next = node?.next
        
        node?.next = nil
        
        count -= 1
        
        if count == 0 { tail = head }
        
        return node?.element
    }
    
    @discardableResult
    public mutating func remove() -> Element? {
        referencedCheck()
        
        guard !isEmpty else { return nil }
        
        let node = tail
        tail = self.node(AtIndex: count - 1 - 1)
        tail?.next = nil
        
        count -= 1
        
        return node?.element
    }
    
    public func firstIndex(where predicate: (_ element: Element) -> Bool) -> Int? {
        guard !isEmpty else { return nil }
        
        var node: Node? = head
        var index = 0
        while let element = node?.next?.element {
            if predicate(element) { return index }
            
            node = node?.next
            index += 1
        }
        
        return nil
    }
    
    public func lastIndex(where predicate: (_ element: Element) -> Bool) -> Int? {
        guard !isEmpty else { return nil }
        
        var node: Node? = head
        var elements = [Element]()
        while let element = node?.next?.element {
            elements.append(element)
            node = node?.next
        }
        
        return elements.lastIndex(where: predicate)
    }
    
}

extension SingleLinkedList {
    
    private mutating func referencedCheck() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head?.next else { return }

        head = .init(element: nil, next: nil)
        head?.next = .init(element: oldNode.element)
        var newNode: Node? = head?.next
        
        while let nextOldNode = oldNode.next {
            newNode?.next = .init(element: nextOldNode.element)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        
        tail = newNode
        
    }
    
    private mutating func referencedCheck(old: Node) -> Node? {
        guard !isKnownUniquelyReferenced(&head) else { return old }
        guard var oldNode = head?.next else { return old }
        
        head = .init(element: nil, next: nil)
        head?.next = .init(element: oldNode.element)
        var newNode: Node? = head?.next
        var nodeCopy: Node?
        
        while let nextOldNode = oldNode.next {
            if oldNode === old { nodeCopy = newNode }
            newNode!.next = .init(element: nextOldNode.element)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        tail = newNode
        
        return nodeCopy
    }
    
    private func node(AtIndex index: Int) -> Node? {
        guard icContainsIndex(index) else { return nil }
        
        var node = head?.next
        var idx = 0
        while node != nil && idx < index {
            node = node?.next
            idx += 1
        }
        return node
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension SingleLinkedList {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - Collection
extension SingleLinkedList {
    
    public struct Index: Comparable {
        public var node: Node?
        
        public init(_ node: Node?) {
            self.node = node
        }
        
        public static func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?): return left.next === right.next
            case (nil, nil): return true
            default: return false
            }
        }
        
        public static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
        
        public var data: Element? { node?.element }
    }
    
    public var startIndex: Index {
        Index(head?.next)
    }
    
    public var endIndex: Index {
        Index(tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(i.node?.next)
    }
    
    public subscript(position: Index) -> Element {
        position.node!.element!
    }
    
}

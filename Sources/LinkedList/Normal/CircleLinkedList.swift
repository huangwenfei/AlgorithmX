//
//  CircleLinkedList.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct CircleLinkedList<Element>: ListProtocol {
    
    public typealias Element = Element
    public typealias Node = CircleLinkedListNode<Element>
    
    public var head: Node?
    public var tail: Node?
    public var current: Node?
    
    public var count: Int
    
    public init() {
        head = nil
        tail = nil
        current = nil
        count = 0
    }
    
    public init<S>(_ elements: S) where S: Sequence, S.Element == Self.Element {
        self.init()
        append(elements: elements)
    }
    
}

extension CircleLinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let first = head else { return "[]" }
        var elements = [Element](arrayLiteral: first.element)
        var node = head?.next
        while let n = node?.element, node !== head {
            elements.append(n)
            node = node?.next
        }
        return elements.description
    }
    
}

// MARK: - ListProtocol
extension CircleLinkedList {
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        referencedCheck()
        
        head = nil
        tail = nil
        current = nil
        count = 0
    }
   
    public func contains(where predicate: (_ element: Element) -> Bool) -> Bool {
        guard let head = head else { return false }
        if predicate(head.element) { return true }
        
        var node: Node? = head.next
        while let element = node?.element, node !== head {
            if predicate(element) { return true }
            node = node?.next
        }
        
        return false
    }
    
    public mutating func push(element: Element) {
        referencedCheck()

        guard count != 0 else {
            head = .init(element: element)
            head?.next = head
            head?.prev = head

            tail = head
            current = head
            
            count += 1
            
            return
        }
        
        let new: Node = .init(prev: head?.prev, element: element, next: head)
        head?.prev = new
        head = new
        
        count += 1
    }
    
    public mutating func append(element: Element) {
        referencedCheck()
        
        guard !isEmpty else { push(element: element) ; return }
        
        let oldTail = tail
        tail = .init(prev: oldTail, element: element, next: head)

        oldTail?.next = tail
        head?.prev = tail
        
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
        
        let next = node(AtIndex: index)
        let prev = next?.prev
        let node: Node = .init(prev: prev, element: element, next: next)
        next?.prev = node
        prev?.next = node
        
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
        node?.next?.prev = prev
        
        if current === node { current = node?.next }
        
        node?.prev = nil
        node?.next = nil
        
        count -= 1
        
        return node?.element
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        referencedCheck()
        
        guard !isEmpty else { return nil }
        
        let node = head
        head = node?.next
        head?.prev = node?.prev
        
        if current === node { current = head }
        
        node?.prev = nil
        node?.next = nil
        
        count -= 1
        
        if count == 0 { tail = nil ; current = nil }
        
        return node?.element
        
    }
    
    @discardableResult
    public mutating func remove() -> Element? {
        referencedCheck()
        
        guard !isEmpty else { return nil }
        
        let node = tail
        tail = tail?.prev
        tail?.next = head
        
        if current === node { current = tail }
        
        node?.prev = nil
        
        count -= 1
        
        if count == 0 { head = nil ; current = nil }
        
        return node?.element

    }
    
    public func firstIndex(where predicate: (_ element: Element) -> Bool) -> Int? {
        guard !isEmpty else { return nil }

        var node: Node? = head
        var index = 0
        while let element = node?.element {
            if predicate(element) { return index }
            
            node = node?.next
            index += 1
        }
        
        return nil
    }
    
    public func lastIndex(where predicate: (_ element: Element) -> Bool) -> Int? {
        guard !isEmpty else { return nil }

        var node: Node? = tail
        var index = count - 1
        while let element = node?.element {
            if predicate(element) { return index }
            
            node = node?.prev
            index -= 1
        }
        
        return nil
    }
    
}

extension CircleLinkedList {
    
    public mutating func reset() {
        current = head
    }
    
    public mutating func prev() -> Element? {
        if current == nil { return nil }
        
        current = current?.prev
        
        return current?.element
    }
    
    public mutating func next() -> Element? {
        if current == nil { return nil }
        
        current = current?.next
        
        return current?.element
    }
    
}

extension CircleLinkedList {
    
    private mutating func referencedCheck() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard let oldHead = head else { return }
        
        let newHead: Node = .init(element: oldHead.element)
        newHead.prev = newHead
        newHead.next = newHead
        head = newHead
        
        var newNode = head
        var oldNode = oldHead
        
        while let nextOldNode = oldNode.next, nextOldNode !== oldHead {
            newNode?.next = .init(prev: newNode, element: nextOldNode.element)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        
        tail = newNode
        
    }
    
    private mutating func referencedCheck(old: Node) -> Node? {
        guard !isKnownUniquelyReferenced(&head) else { return old }
        guard let oldHead = head else { return old }
        
        let newHead: Node = .init(element: oldHead.element)
        newHead.prev = newHead
        newHead.next = newHead
        head = newHead
        
        var newNode = head
        var oldNode = oldHead
        
        var nodeCopy: Node? = old === oldHead ? oldHead : nil
        let uncheck = nodeCopy != nil ? true : false
        
        while let nextOldNode = oldNode.next, nextOldNode !== oldHead {
            if !uncheck, old === nextOldNode { nodeCopy = nextOldNode }
            newNode?.next = .init(prev: newNode, element: nextOldNode.element)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        
        tail = newNode
        
        return nodeCopy
    }
    
    private func node(AtIndex index: Int) -> Node? {
        guard icContainsIndex(index) else { return nil }
        
        if index < (count >> 1) {
            var node = head
            for _ in 0 ..< index { node = node?.next }
            return node
        } else {
            var node = tail
            for _ in stride(from: count - 1, to: index, by: -1) { node = node?.prev }
            return node
        }
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension CircleLinkedList {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - Collection
extension CircleLinkedList {
    
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
    
    public func index(before i: Index) -> Index {
        Index(i.node?.prev)
    }
    
    public func index(after i: Index) -> Index {
        Index(i.node?.next)
    }
    
    public subscript(position: Index) -> Element {
        position.node!.element
    }
    
}

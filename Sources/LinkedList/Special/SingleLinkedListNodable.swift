//
//  SingleLinkedListNodable.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/5.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

// MARK: - SingleLinkedListNodableNode
public protocol SingleLinkedListNodableProtocol: NodableProtocol {
    
    func setElement(_ element: Element?)
    func getElement() -> Element?
    
    func setNext(_ next: Self?)
    func getNext() -> Self?
    
    init(element: Self.Element?)
    init(element: Self.Element?, next: Self?)
    
}

// MARK: - SingleLinkedListNodable
public struct SingleLinkedListNodable<Node>: ListNodableProtocol where Node: SingleLinkedListNodableProtocol {
    
    public var head: Node?
    public var tail: Node?
    
    public var count: Int
    
    public init() {
        head = .init(element: nil, next: nil)
        tail = head
        count = 0
    }
    
    public init(_ elements: [Node.Element]) {
        self.init()
        for element in elements { append(element: element) }
    }
    
    public init(_ nodes: [Node]) {
        self.init()
        for node in nodes { append(node: node) }
    }
    
}

extension SingleLinkedListNodable: CustomStringConvertible {
    
    public var description: String {
        var elements = [Node.Element]()
        var node = head?.getNext()
        while let n = node?.getElement() {
            elements.append(n)
            node = node?.getNext()
        }
        return elements.description
    }
    
}

// MARK: - ListNodableProtocol
extension SingleLinkedListNodable {

    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        head?.setNext(nil)
        tail = head
        count = 0
    }
    
    public func contains(where predicate: (_ element: Node.Element) -> Bool) -> Bool {
        guard !isEmpty else { return false }
        
        var node: Node? = head
        while let element = node?.getNext()?.getElement() {
            if predicate(element) { return true }
            node = node?.getNext()
        }
        
        return false
    }
    
    public func contains(where predicate: (_ node: Node) -> Bool) -> Bool {
        guard !isEmpty else { return false }
        
        var node: Node? = head
        while let element = node?.getNext() {
            if predicate(element) { return true }
            node = node?.getNext()
        }
        
        return false
    }
    
    public mutating func push(element: Node.Element) {
        referencedCheck()
        
        head?.setNext(.init(element: element, next: head?.getNext()))
        
        if count == 0 { tail = head?.getNext() }
        
        count += 1
    }
    
    public mutating func push(node: Node) {
        referencedCheck()
        
        guard !isContains(node) else { return }
        
        /// push
        node.setNext(head?.getNext())
        head?.setNext(node)
        
        if count == 0 { tail = head?.getNext() }
        
        count += 1
    }
    
    public mutating func append(element: Node.Element) {
        referencedCheck()
        
        guard !isEmpty else { push(element: element) ; return }
        
        tail?.setNext(.init(element: element))
        tail = tail?.getNext()
        
        count += 1
    }
    
    public mutating func append(elements: [Node.Element]) {
        for element in elements { append(element: element) }
    }
    
    public mutating func append(node: Node) {
        referencedCheck()
        
        guard !isContains(node) else { return }
        
        guard !isEmpty else { push(node: node) ; return }
        
        tail?.setNext(node)
        tail = tail?.getNext()
        
        count += 1
    }
    
    public mutating func append(nodes: [Node]) {
        for node in nodes { append(node: node) }
    }

    public func element(AtIndex index: Int) -> Node.Element? {
        node(AtIndex: index)?.getElement()
    }
    
    public func element(before index: Int) -> Node.Element? {
        var current = head
        var prev: Node?
        
        var idx = 0
        while let next = current?.getNext() {
            if idx == index { break }
            prev = next
            current = current?.getNext()
            idx += 1
        }
        
        return prev?.getElement()
    }
    
    public func element(after index: Int) -> Node.Element? {
        var current = head
        
        var idx = 0
        while let next = current?.getNext() {
            if idx == index { return next.getNext()?.getElement() }
            current = current?.getNext()
            idx += 1
        }
        
        return nil
    }
    
    public func node(AtIndex index: Int) -> Node? {
        guard icContainsIndex(index) else { return nil }
        
        var node = head?.getNext()
        var idx = 0
        while node != nil && idx < index {
            node = node?.getNext()
            idx += 1
        }
        return node
    }
    
    public func node(before node: Node) -> Node? {
        
        var current = head
        var prev: Node?
        
        while let next = current?.getNext() {
            if node === next { break }
            prev = next
            current = current?.getNext()
        }
        
        return prev
    }
    
    public func node(after node: Node) -> Node? {
        
        var current = head
        while let next = current?.getNext() {
            if node === next { return next.getNext() }
            current = current?.getNext()
        }
        
        return nil
    }

    @discardableResult
    public mutating func replace(element: Node.Element, at index: Int) -> Node.Element? {
        referencedCheck()
        
        guard icContainsIndex(index) else { return nil }
        
        let node = self.node(AtIndex: index)
        let old = node?.getElement()
        node?.setElement(element)
        
        return old
    }
    
    @discardableResult
    public mutating func replace(node: Node, at index: Int) -> Node? {
        referencedCheck()
        
        guard icContainsIndex(index) else { return nil }
        guard !isContains(node) else { return nil }
        
        let prev = self.node(AtIndex: index - 1)
        let old = prev?.getNext()
        
        node.setNext(old?.getNext())
        prev?.setNext(node)
        
        old?.setNext(nil)
        
        if index == count - 1 { tail = node }
        
        return old
    }
    
    public mutating func replace(node: Node, by new: Node) {
        let copyOld = referencedCheck(old: node)
        
        guard let prev = self.node(before: node) else { return }
        
        guard !isContains(new) else { return }
        
        new.setNext(copyOld?.getNext())
        prev.setNext(new)
        
        copyOld?.setNext(nil)
        
        if copyOld === tail { tail = new }
        
    }
    
    public mutating func insert(element: Node.Element, at index: Int) {
        referencedCheck()
        
        guard !isEmpty else { push(element: element) ; return }
        
        guard index != 0 else { push(element: element) ; return }
        guard index != count - 1 else { append(element: element) ; return }
        
        let prev = node(AtIndex: index - 1)
        prev?.setNext(.init(element: element, next: prev?.getNext()))

        count += 1
        
    }
    
    public mutating func insert(element: Node.Element, after: Node) {
        let copyOld = referencedCheck(old: after)
        
        let node: Node = .init(element: element, next: copyOld?.getNext())
        copyOld?.setNext(node)
        
        if copyOld === tail { tail = node }

        count += 1
    }
    
    public mutating func insert(node: Node, at index: Int) {
        referencedCheck()
        
        guard !isEmpty else { push(node: node) ; return }
        
        guard !isContains(node) else { return }
        
        guard index != 0 else { push(node: node) ; return }
        guard index != count - 1 else { append(node: node) ; return }
        
        let prev = self.node(AtIndex: index - 1)
        node.setNext(prev?.getNext())
        prev?.setNext(node)

        count += 1
    }
    
    public mutating func insert(node: Node, after: Node) {
        let copyOld = referencedCheck(old: after)
        
        guard !isContains(node) else { return }
        
        let node: Node = .init(
            element: node.getElement(), next: copyOld?.getNext()
        )
        copyOld?.setNext(node)
        
        if copyOld === tail { tail = node }

        count += 1
    }

    @discardableResult
    public mutating func removeElement(at index: Int) -> Node.Element? {
        referencedCheck()
        
        guard icContainsIndex(index) else { return nil }
        
        guard !isEmpty else { return nil }
        
        guard index != 0 else { return pop()?.getElement() }
        guard index != count - 1 else { return remove()?.getElement() }
        
        let prev = self.node(AtIndex: index - 1)
        let node = prev?.getNext()
        prev?.setNext(node?.getNext())
        
        node?.setNext(nil)
        
        count -= 1
        
        return node?.getElement()
    }
    
    @discardableResult
    public mutating func removeNode(at index: Int) -> Node? {
        referencedCheck()
        
        guard icContainsIndex(index) else { return nil }
        
        guard !isEmpty else { return nil }
        
        guard index != 0 else { return pop() }
        guard index != count - 1 else { return remove() }
        
        let prev = self.node(AtIndex: index - 1)
        let node = prev?.getNext()
        prev?.setNext(node?.getNext())
        
        node?.setNext(nil)
        
        count -= 1
        
        return node
    }
    
    @discardableResult
    public mutating func remove(node: Node) -> Node? {
        guard !isEmpty else { return nil }
        
        let copyOld = referencedCheck(old: node)
        
        guard node !== tail else { return remove() }
        
        let prev = self.node(before: copyOld!)
        prev?.setNext(copyOld?.getNext())
        
        copyOld?.setNext(nil)
        
        count -= 1
        
        return copyOld
    }
    
    @discardableResult
    public mutating func remove(after node: Node) -> Node? {
        guard !isEmpty else { return nil }
        
        let copyOld = referencedCheck(old: node)
        
        guard copyOld !== tail else { return nil }
        
        guard count != 1 else { return pop() }
        guard copyOld?.getNext() != nil else { return remove() }
        
        let node = copyOld?.getNext()
        copyOld?.setNext(node?.getNext())
        
        node?.setNext(nil)
        
        count -= 1
        
        return node
    }

    @discardableResult
    public mutating func pop() -> Node? {
        referencedCheck()
        
        guard !isEmpty else { return nil }
        
        let node = head?.getNext()
        head?.setNext(node?.getNext())
        
        node?.setNext(nil)
        
        count -= 1
        
        if count == 0 { tail = head }
        
        return node
    }
    
    @discardableResult
    public mutating func remove() -> Node? {
        referencedCheck()
        
        guard !isEmpty else { return nil }
        
        let node = tail
        tail = self.node(AtIndex: count - 1 - 1)
        tail?.setNext(nil)
        
        count -= 1
        
        return node
    }
    
    public func firstIndex(where predicate: (_ element: Node.Element) -> Bool) -> Int? {
        guard !isEmpty else { return nil }
        
        var node: Node? = head
        var index = 0
        while let element = node?.getNext()?.getElement() {
            if predicate(element) { return index }
            
            node = node?.getNext()
            index += 1
        }
        
        return nil
    }
    
    public func firstIndex(where predicate: (_ node: Node) -> Bool) -> Int? {
        guard !isEmpty else { return nil }
        
        var node: Node? = head
        var index = 0
        while let element = node?.getNext() {
            if predicate(element) { return index }
            
            node = node?.getNext()
            index += 1
        }
        
        return nil
    }
    
    public func lastIndex(where predicate: (_ element: Node.Element) -> Bool) -> Int? {
        guard !isEmpty else { return nil }
        
        var node: Node? = head
        var elements = [Node.Element]()
        while let element = node?.getNext()?.getElement() {
            elements.append(element)
            node = node?.getNext()
        }
        
        return elements.lastIndex(where: predicate)
    }
    
    public func lastIndex(where predicate: (_ node: Node) -> Bool) -> Int? {
        guard !isEmpty else { return nil }
        
        var node: Node? = head
        var elements = [Node]()
        while let element = node?.getNext() {
            elements.append(element)
            node = node?.getNext()
        }

        return elements.lastIndex(where: predicate)
    }
    
}

extension SingleLinkedListNodable {
    
    private mutating func referencedCheck() {
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head?.getNext() else { return }

        head = .init(element: nil, next: nil)
        head?.setNext(.init(element: oldNode.getElement()))
        var newNode: Node? = head?.getNext()
        
        while let nextOldNode = oldNode.getNext() {
            newNode?.setNext(.init(element: nextOldNode.getElement()))
            newNode = newNode?.getNext()
            oldNode = nextOldNode
        }
        
        tail = newNode
        
    }
    
    private mutating func referencedCheck(old: Node) -> Node? {
        guard !isKnownUniquelyReferenced(&head) else { return old }
        guard var oldNode = head?.getNext() else { return old }
        
        head = .init(element: nil, next: nil)
        head?.setNext(.init(element: oldNode.getElement()))
        var newNode: Node? = head?.getNext()
        var nodeCopy: Node?
        
        while let nextOldNode = oldNode.getNext() {
            if oldNode === old { nodeCopy = newNode }
            newNode!.setNext(.init(element: nextOldNode.getElement()))
            newNode = newNode!.getNext()
            oldNode = nextOldNode
        }
        
        tail = newNode
        
        return nodeCopy
    }

}

// MARK: - ExpressibleByArrayLiteral
extension SingleLinkedListNodable {
    
    public init(arrayLiteralElement elements: Node.Element...) {
        self.init()
        for element in elements { append(element: element) }
    }
    
    public init(arrayLiteral elements: Node...) {
        self.init()
        for node in elements { append(node: node) }
    }
    
}

// MARK: - Collection
extension SingleLinkedListNodable {
    
    public typealias Element = Node
    
    public struct Index: Comparable {
        public var node: Node?
        
        public init(_ node: Node?) {
            self.node = node
        }
        
        public static func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?): return left.getNext() === right.getNext()
            case (nil, nil): return true
            default: return false
            }
        }
        
        public static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.getNext() }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        Index(head?.getNext())
    }
    
    public var endIndex: Index {
        Index(tail?.getNext())
    }
    
    public func index(after i: Index) -> Index {
        Index(i.node?.getNext())
    }
    
    public subscript(position: Index) -> Element {
        position.node!
    }
    
}

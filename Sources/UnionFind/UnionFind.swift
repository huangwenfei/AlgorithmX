//
//  UnionFind.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/4.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

//import TreePrinter

public struct UnionFind<Element: Hashable>: UnionFindProtocol {
    
    public typealias Element = Element
    
    private var nodes = [Element: Node]()
    public private(set) var components: Int = 0
    
    public init() { }
    
    public init<S>(sets: S) where S: Sequence, S.Element == Element {
        makeSet(elements: sets)
    }
    
    public mutating func makeSet(element: Element) {
        referencedCheck()
        
        guard nodes[element] == nil else { return }
        nodes[element] = Node(element: element)
        
        components += 1
    }
    
    public mutating func makeSet(_ element: Element) {
        self.makeSet(element: element)
    }
    
    public mutating func makeSet<S>(elements: S) where S: Sequence, S.Element == Element {
        for element in elements { makeSet(element) }
    }
    
    public mutating func find(element: Element) -> Element? {
        referencedCheck()
        
        return findRootNode(element: element)?.element
    }
    
    public mutating func find(_ element: Element) -> Element? {
        self.find(element: element)
    }
    
    public mutating func union(element1: Element, element2: Element) {
        referencedCheck()
        
        guard
            let p1 = findRootNode(element: element1),
            let p2 = findRootNode(element: element2),
            p1.element != p2.element
        else {
            return
        }
        
        if (p1.rank < p2.rank) {
            p1.parent = p2
        } else if (p1.rank > p2.rank) {
            p2.parent = p1
        } else {
            p1.parent = p2
            p2.rank += 1
        }
        
        components -= 1
    }
    
    public mutating func union(_ element1: Element, _ element2: Element) {
        self.union(element1: element1, element2: element2)
    }
    
}

extension UnionFind {
    
    /**
     * 找出 element 的根节点
     */
    private func findRootNode(element: Element) -> Node? {
        guard var node = nodes[element] else { return nil }
        
        while node.element != node.parent.element {
            node.parent = node.parent.parent
            node = node.parent
        }
        
        return node
    }
    
    private mutating func referencedCheck() {
        var random = nodes.randomElement()?.value
        guard !isKnownUniquelyReferenced(&random) else { return }
        
        var copies: [Int: Node] = [:]
        func nodeCopy(_ old: Node) -> Node {
            guard let new = copies[old.hashValue] else {
                let node: Node = .init(excludeParent: old)
                copies[old.hashValue] = node
                return node
            }
            return new
        }
        
        var iterator = nodes.makeIterator()
        while let pair = iterator.next() {
            let key = pair.key
            let value = pair.value
            nodes[key] = nodeCopy(value)
            nodes[key]?.parent = nodeCopy(value.parent)
        }
        
    }
    
}

// MARK: - Node
extension UnionFind {
    
    private struct OldNew: Hashable {
        var hash: Int
        var new: Node
    }
    
    public final class Node: Hashable {

        public var element: Element
        public var parent: Node! = nil
        public var rank: Int
        
        public init(element: Element) {
            self.element = element
            self.rank = 1
            self.parent = self
        }
        
        public init(element: Element, rank: Int) {
            self.element = element
            self.rank = rank
            self.parent = self
        }
        
        public init(excludeParent other: Node) {
            self.element = other.element
            self.rank = other.rank
            self.parent = self
        }
        
        public static func == (lhs: Node, rhs: Node) -> Bool {
            lhs.element == rhs.element &&
            lhs.parent.element == rhs.parent.element &&
            lhs.rank == rhs.rank
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(element)
            hasher.combine(parent.element)
            hasher.combine(rank)
        }
        
    }
    
}

//// MARK: TreeRepresentable
//extension UnionFind.Node: TreeRepresentable {
//    
//    public var name: String {
//        "\(element)"
//    }
//    
//    public var subnodes: [UnionFind<Element>.Node] {
//        parent === self ? [] : [parent!]
//    }
//    
//}


// MARK: - Sequence
extension UnionFind {
    
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
        .init(elements: nodes.keys.map { $0 })
    }
    
}

// MARK: CustomStringConvertible
extension UnionFind {
    
    public var description: String { ""
//        nodes.description
    }
    
}

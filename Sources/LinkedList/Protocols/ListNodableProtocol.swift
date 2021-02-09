//
//  ListNodableProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/5.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol NodableProtocol: AnyObject {
    
    associatedtype Element
    
}

public protocol ListNodableProtocol: CustomStringConvertible, Collection, ExpressibleByArrayLiteral {
    
    associatedtype Node: NodableProtocol
    
    init()
    
    init(_ elements: [Node.Element])
    init(_ nodes: [Node])
    
    /// 元素的数量
    var count: Int { get }

    /// 是否为空
    var isEmpty: Bool { get }
    
    /**
     * 清除所有元素
     */
    mutating func clear()
    
    /**
     * 是否包含某个元素
     * @param Node
     * @return
     */
    func contains(where predicate: (_ element: Node.Element) -> Bool) -> Bool
    func contains(where predicate: (_ node: Node) -> Bool) -> Bool

    /**
     * 添加元素到头部
     * @param Node
     */
    mutating func push(element: Node.Element)
    mutating func push(node: Node)
    
    /**
     * 添加元素到尾部
     * @param Node
     */
    mutating func append(element: Node.Element)
    mutating func append(elements: [Node.Element])
    
    mutating func append(node: Node)
    mutating func append(nodes: [Node])

    /**
     * 获取 index 位置的元素
     * @param index
     * @return
     */
    func element(AtIndex index: Int) -> Node.Element?
    func element(before index: Int) -> Node.Element?
    func element(after index: Int) -> Node.Element?
    
    func node(AtIndex index: Int) -> Node?
    func node(before node: Node) -> Node?
    func node(after node: Node) -> Node?
    
    /**
     * 设置 index 位置的元素
     * @param Node
     * @param index
     * @return 原来的元素ֵ
     */
    @discardableResult
    mutating func replace(element: Node.Element, at index: Int) -> Node.Element?
    
    @discardableResult
    mutating func replace(node: Node, at index: Int) -> Node?
    
    mutating func replace(node: Node, by new: Node)

    /**
     * 在 index 位置插入一个元素
     * @param Node
     * @param index
     */
    mutating func insert(element: Node.Element, at index: Int)
    mutating func insert(element: Node.Element, after: Node)
    
    mutating func insert(node: Node, at index: Int)
    mutating func insert(node: Node, after: Node)

    /**
     * 删除 index 位置的元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func removeElement(at index: Int) -> Node.Element?
    
    @discardableResult mutating func removeNode(at index: Int) -> Node?
    @discardableResult mutating func remove(node: Node) -> Node?
    @discardableResult mutating func remove(after node: Node) -> Node?

    /**
     * 删除 第一个 元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func pop() -> Node?
    
    /**
     * 删除 最后一个 元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func remove() -> Node?
    
    /**
     * 正序查看元素的索引
     * @param node
     * @return
     */
    func firstIndex(where predicate: (_ element: Node.Element) -> Bool) -> Int?
    func firstIndex(where predicate: (_ node: Node) -> Bool) -> Int?
    
    /**
     * 逆序查看元素的索引
     * @param node
     * @return
     */
    func lastIndex(where predicate: (_ element: Node.Element) -> Bool) -> Int?
    func lastIndex(where predicate: (_ node: Node) -> Bool) -> Int?
}

extension ListNodableProtocol {
    
    internal func icContainsIndex(_ index: Int) -> Bool {
        guard !isEmpty else { return false }
        return (0 ..< count).contains(index)
    }
    
}

extension ListNodableProtocol {
    
    public func isContains(_ value: Node) -> Bool {
        contains { $0 === value }
    }
    
}

extension ListNodableProtocol where Self.Node.Element: Equatable {
    
    public func isContains(_ value: Node.Element) -> Bool {
        contains { $0 == value }
    }
    
}

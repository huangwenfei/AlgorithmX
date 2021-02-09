//
//  ListProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol ListProtocol: CustomStringConvertible, Collection, ExpressibleByArrayLiteral {
    
    associatedtype Element
    
    init()
    
    init<S>(_ elements: S) where S: Sequence, S.Element == Self.Element
    
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
     * @param element
     * @return
     */
    func contains(where predicate: (_ element: Element) -> Bool) -> Bool

    /**
     * 添加元素到头部
     * @param element
     */
    mutating func push(element: Element)
    
    /**
     * 添加元素到尾部
     * @param element
     */
    mutating func append(element: Element)
    mutating func append<S>(elements: S) where S: Sequence, S.Element == Self.Element

    /**
     * 获取 index 位置的元素
     * @param index
     * @return
     */
    func element(AtIndex index: Int) -> Element?

    /**
     * 设置 index 位置的元素
     * @param element
     * @param index
     * @return 原来的元素ֵ
     */
    @discardableResult
    mutating func replace(element: Element, at index: Int) -> Element?

    /**
     * 在 index 位置插入一个元素
     * @param element
     * @param index
     */
    mutating func insert(element: Element, at index: Int)

    /**
     * 删除 index 位置的元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func remove(at index: Int) -> Element?

    /**
     * 删除 第一个 元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func pop() -> Element?
    
    /**
     * 删除 最后一个 元素
     * @param index
     * @return
     */
    @discardableResult
    mutating func remove() -> Element?
    
    /**
     * 正序查看元素的索引
     * @param element
     * @return
     */
    func firstIndex(where predicate: (_ element: Element) -> Bool) -> Int?
    
    /**
     * 逆序查看元素的索引
     * @param element
     * @return
     */
    func lastIndex(where predicate: (_ element: Element) -> Bool) -> Int?
}

extension ListProtocol {
    
    internal func icContainsIndex(_ index: Int) -> Bool {
        guard !isEmpty else { return false }
        return (0 ..< count).contains(index)
    }
    
}

extension ListProtocol where Self.Element: Equatable {
    
    public func isContains(_ value: Element) -> Bool {
        contains { $0 == value }
    }
    
}

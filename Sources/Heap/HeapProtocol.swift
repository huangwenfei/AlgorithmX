//
//  HeapProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

import Foundation

public protocol HeapProtocol: CustomStringConvertible {
    
    associatedtype Element
    
    typealias Comparator = (_ lhs: Element, _ rhs: Element) -> Bool
    
    init(comparator: @escaping Comparator)
    init<S>(elements: S, comparator: @escaping Comparator) where S: Sequence, S.Element == Element
    
    /// 元素的数量
    var count: Int { get }
    
    /// 是否为空
    var isEmpty: Bool { get }
    
    /// 清空
    mutating func clear()
    
    /// 添加元素
    mutating func add(element: Element)
    
    /// 添加多个元素
    mutating func add<S>(elements: S) where S: Sequence, S.Element == Element
    
    /// 获得堆顶元素
    var peek: Element? { get }
    
    /// 删除堆顶元素
    @discardableResult
    mutating func remove() -> Element?
    
    /// 删除堆顶元素的同时插入一个新元素
    @discardableResult
    mutating func replace(element: Element) -> Element?
    
    /// 重新建堆
    mutating func reheap(byNewComparator new: @escaping Comparator)
}

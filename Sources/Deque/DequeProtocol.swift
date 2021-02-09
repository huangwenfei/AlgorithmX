//
//  DequeProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol DequeProtocol: Sequence, ExpressibleByArrayLiteral {
    
    associatedtype Element
    
    init()
    
    init(_ elements: [Element])
    
    /// 元素的数量
    var count: Int { get }
    
    /// 是否为空
    var isEmpty: Bool { get }
    
    /// 清空元素
    mutating func clear()
    
    /// 队首元素
    var front: Element? { get }

    /// 队尾元素
    var rear: Element? { get }
    
    /// 从队首入队
    @discardableResult
    mutating func enqueue(front element: Element) -> Bool
    
    @discardableResult
    mutating func enqueue(fronts elements: [Element]) -> Bool

    /// 从队尾入队
    @discardableResult
    mutating func enqueue(rear element: Element) -> Bool
    
    @discardableResult
    mutating func enqueue(rears elements: [Element]) -> Bool

    /// 从队首出队
    @discardableResult
    mutating func dequeueFront() -> Element?

    /// 从队尾出队
    @discardableResult
    mutating func dequeueRear() -> Element?
    
}

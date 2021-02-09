//
//  QueueProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

public protocol QueueProtocol: Sequence, ExpressibleByArrayLiteral {
    
    associatedtype Element
    
    init()
    
    init(_ elements: [Element])
    
    /// 元素的数量
    var count: Int { get }
    
    /// 是否为空
    var isEmpty: Bool { get }
    
    /// 清空元素
    mutating func clear()
    
    /// 入队
    @discardableResult
    mutating func enqueue(_ element: Element) -> Bool
    
    @discardableResult
    mutating func enqueue(elements: [Element]) -> Bool
    
    /// 查看队首元素
    var peek: Element? { get }
    
    /// 出队
    @discardableResult
    mutating func dequeue() -> Element?
}

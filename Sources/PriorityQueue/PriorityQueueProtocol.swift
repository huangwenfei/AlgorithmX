//
//  PriorityQueueProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol PriorityQueueProtocol {
    
    associatedtype Element
    
    /// 元素的数量
    var count: Int { get }
    
    /// 是否为空
    var isEmpty: Bool { get }
    
    /// 清空元素
    mutating func clear()
    
    /// 入队
    mutating func enqueue(_ element: Element)
    
    /// 查看队头元素
    var peek: Element? { get }
    
    /// 出队
    mutating func dequeue() -> Element?
}

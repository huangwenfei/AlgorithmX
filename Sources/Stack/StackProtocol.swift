//
//  StackProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol StackProtocol: Sequence, ExpressibleByArrayLiteral {
    
    associatedtype Element
    
    init()
    
    init(_ elements: [Element])
    
    /// 元素的数量
    var count: Int { get }

    /// 是否为空
    var isEmpty: Bool { get }
    
    /// 清空所有元素
    mutating func clear()
    
    /// 从栈顶压入元素
    mutating func push(_ element: Element)
    
    /// 查看栈顶元素
    var peek: Element? { get }
    
    /// 从栈顶弹出元素
    @discardableResult
    mutating func pop() -> Element?

    /// Combine
    static func + (lhs: Self, rhs: Self) -> Self
    
}



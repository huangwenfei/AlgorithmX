//
//  UnionFindProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/4.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol UnionFindProtocol: Sequence, CustomStringConvertible where Element: Equatable {
    
    var components: Int { get }
    
    /// Init
    init()
    init<S>(sets: S) where S: Sequence, S.Element == Element
    
    /**
     * 创建含有 element 一个元素的集合（element 是根节点）
     * @param v
     * @return
     */
    mutating func makeSet(element: Element)
    mutating func makeSet(_ element: Element)
    
    mutating func makeSet<S>(elements: S) where S: Sequence, S.Element == Element
    
    /**
     * 查找 element 所属的集合（根节点）
     * @param element
     * @return
     */
    mutating func find(element: Element) -> Element?
    mutating func find(_ element: Element) -> Element?

    /**
     * 合并 element1、element2 所在的集合
     */
    mutating func union(element1: Element, element2: Element)
    mutating func union(_ element1: Element, _ element2: Element)
    
}

extension UnionFindProtocol {
    
    /**
     * 检查 element1、element2 是否属于同一个集合
     */
    public mutating func isSame(lhs: Element, rhs: Element) -> Bool {
        find(lhs) == find(rhs)
    }
    
    public mutating func isSame(_ lhs: Element, _ rhs: Element) -> Bool {
        find(lhs) == find(rhs)
    }
    
}

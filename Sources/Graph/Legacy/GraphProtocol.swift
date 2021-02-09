//
//  GraphProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/2.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol GraphProtocol {
    
    init()
    
    /// - Tag: Base
    var verticesCount: Int { get }
    var edgesCount: Int { get }
    
    associatedtype Element: GraphVertexable
    associatedtype Weight: GraphWeightable
    
    mutating func add(vertex data: Element)
    mutating func remove(vertex data: Element)
    
    mutating func addEdge(from fromData: Element, to toData: Element)
    mutating func addEdge(from fromData: Element, to toData: Element, weight: Weight)
    
    mutating func removeEdge(from fromData: Element, to toData: Element)
    
    /// - Tag: Search
    func breadthFirstSearch(begin beginData: Element) -> [Element]
    func depthFirstSearch(begin beginData: Element) -> [Element]
    
    func breadthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool)
    func depthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool)
    
    /// - Tag: Topological Sort
    func topologicalSort() -> [Element]
    
    /// - Tag: Minimum Spanning Tree
    func prim() -> Set<GraphEdgeInfo<Element, Weight>>
    func kruskal() -> Set<GraphEdgeInfo<Element, Weight>>
    
    /// - Tag: Shortest Path
    /// Support negative weight edge, can detect whether there is a negative weight cycle.
    func bellmanFordShortestPath(begin: Element) -> [Element: GraphPathInfo<Element, Weight>]
    
    /// Negative edge weights are not supported.
    func dijkstraShortestPath(begin: Element) -> [Element: GraphPathInfo<Element, Weight>]

    /// 
    func floydShortestPath() -> [Element: [Element: GraphPathInfo<Element, Weight>]]
    
}

//
//  MatrixGraph.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/2.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct MatrixGraph<Element: GraphVertexable, Weight: GraphWeightable>: GraphProtocol {

    public typealias Element = Element
    public typealias Weight = Weight
    
    private var vertices: [GraphVertex<Element>] = []
    private var weights: [[Weight?]] = []
    
    public init() { }
    
}

extension MatrixGraph {
    
    public var verticesCount: Int { vertices.count }
    public var edgesCount: Int { weights.reduce(0) { $0 + $1.count } }
    
    public mutating func add(vertex data: Element) {
        
    }
    
    public mutating func remove(vertex data: Element) {
        
    }
    
    public mutating func addEdge(from fromData: Element, to toData: Element) {
        
    }
    
    public mutating func addEdge(from fromData: Element, to toData: Element, weight: Weight) {
        
    }
    
    public mutating func removeEdge(from fromData: Element, to toData: Element) {
        
    }
    
}

// MARK: GraphProtocol.Search
extension MatrixGraph {
    
    public func breadthFirstSearch(begin beginData: Element) -> [Element] {
        []
    }
    
    public func depthFirstSearch(begin beginData: Element) -> [Element] {
        []
    }
    
    public func breadthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool) {
        
    }
    
    public func depthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool) {
        
    }
    
}

// MARK: GraphProtocol.TopologicalSort
extension MatrixGraph {
    
    public func topologicalSort() -> [Element] {
        []
    }
    
}

// MARK: - Minimum Spanning Tree
extension MatrixGraph {
    
    public func prim() -> Set<GraphEdgeInfo<Element, Weight>> {
        []
    }
    
    public func kruskal() -> Set<GraphEdgeInfo<Element, Weight>> {
        []
    }
    
}

//MARK: - Shortest Path
extension MatrixGraph {
    
    public typealias PathInfo = GraphPathInfo<Element, Weight>
    
    public func bellmanFordShortestPath(begin: Element) -> [Element: PathInfo] {
        [:]
    }
    
    public func dijkstraShortestPath(begin: Element) -> [Element: PathInfo] {
        [:]
    }

    public func floydShortestPath() -> [Element: [Element: PathInfo]] {
        [:]
    }

}

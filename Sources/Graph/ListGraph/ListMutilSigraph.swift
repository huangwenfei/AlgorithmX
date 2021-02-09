//
//  ListMutilSigraph.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/18.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public typealias DULGraph = ListMutilSigraph

/** Undirected Simple MutilGraph
 */

public struct ListUnweightedMutilSigraph<Element: ListGraphVertexable>: ListUnweightedMutilSigraphProtocol {

    public typealias Element = Element
    public typealias Weight = ListUnweighted
    
    public typealias Edge = ListUndirectedEdge<Element, Weight>
    public typealias Vertex = ListVertex<Element>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    /// - Tag: Directed & Mutil & Weighted
    public var isDirected: Bool { false }
    public var isMutil: Bool { true }
    public var isWeighted: Bool { false }
    
    /// - Tag: Init
    public init() { }
    
    public init<S>(vertices: S) where S: Sequence, S.Element == Element {
        
    }
    
    public init(edges: ListUndirectedVertexPair<Element>.Tuple...) {
        
    }
    
    public init(edges: ListUndirectedVertexPair<Element>...) {
        
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListUndirectedVertexPair<Element> {
        
    }
    
    public init<S>(edges: S) where S : Sequence, S.Element == (vertex1: Self.Element, vertex2: Self.Element) {
        
    }
    
}

// MARK: ListUnweightedMutilSigraphProtocol.Vertex
extension ListUnweightedMutilSigraph {

    public var vertexCount: Int { vertices.count }
    
    public func inDegrees(byVertex vertex: Element) -> Int {
        0
    }
    
    public func outDegrees(byVertex vertex: Element) -> Int {
        0
    }
    
    @discardableResult
    public mutating func add(vertex: Element) -> Vertex? {
        nil
    }
    
    @discardableResult
    public mutating func add<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element {
        []
    }
    
    @discardableResult
    public mutating func remove(vertex: Element) -> Vertex? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element {
        []
    }
    
    @discardableResult
    public mutating func replace(vertex: Element, with new: Element) -> ReplaceVertexTuple? {
        nil
    }
    
}

// MARK: ListUnweightedMutilSigraphProtocol.Edge
extension ListUnweightedMutilSigraph {

    public var edgeCount: Int { edges.count }
    
    @discardableResult
    public mutating func add(edgeInVertex1 vertex1: Element, vertex2: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> Edge? {
        
        nil
    }
    
    @discardableResult
    public mutating func add<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S : Sequence, S.Element == (vertex1: Self.Element, vertex2: Self.Element) {
        []
    }
    
    @discardableResult
    public mutating func add<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S : Sequence, S.Element == ListUndirectedVertexPair<Self.Element> {
        []
    }
    
    @discardableResult
    public mutating func remove(edgeByVertex1 vertex1: Element, vertex2: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S : Sequence, S.Element == (vertex1: Self.Element, vertex2: Self.Element) {
        []
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S : Sequence, S.Element == ListUndirectedVertexPair<Self.Element> {
        []
    }
    
    @discardableResult
    public mutating func add(selfLoopEdgeInVertex vertex: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add<S>(selfLoopEdgeInVertices vertices: S) -> [Edge] where S : Sequence, Self.Element == S.Element {
        []
    }
    
    @discardableResult
    public mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(selfLoopEdgeInVertices vertices: S) -> [Edge] where S : Sequence, Self.Element == S.Element {
        []
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>) -> ReplaceEdgeTuple? {
        nil
    }
    
}

// MARK: ListUnweightedMutilSigraphProtocol
extension ListUnweightedMutilSigraph {
    
    /// - Tag: Traversal
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
    
    /// - Tag: Components
    public func components() -> UnionFind<Element> {
        .init()
    }
    
    /// - Tag: Topological Sort
    public func topologicalSort() -> [Element] {
        []
    }
    
    /// - Tag: Minimum Spanning Tree
    public func prim() -> Set<EdgeInfo> {
        .init()
    }
    
    public func kruskal() -> Set<EdgeInfo> {
        .init()
    }
    
    /// - Tag: Shortest Path
    /// Support negative weight edge, can detect whether there is a negative weight cycle.
    public func bellmanFordShortestPath(begin: Element) -> [Element: PathInfo] {
        [:]
    }
    
    /// Negative edge weights are not supported.
    public func dijkstraShortestPath(begin: Element) -> [Element: PathInfo] {
        [:]
    }
    
    public func floydShortestPath() -> [Element: [Element: PathInfo]] {
        [:]
    }
    
    public func bidirectionalShortestPath(begin: Element, end: Element) -> PathInfo? {
        nil
    }
    
}

// MARK: ListMutilSigraph
public struct ListMutilSigraph<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListWeightedMutilSigraphProtocol {
    
    public typealias Element = Element
    public typealias Weight = Weight
    
    public typealias Edge = ListUndirectedEdge<Element, Weight>
    public typealias Vertex = ListVertex<Element>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    /// - Tag: Directed & Mutil & Weighted
    public var isDirected: Bool { false }
    public var isMutil: Bool { true }
    public var isWeighted: Bool { Weight.self != ListUnweighted.self }
    
    /// - Tag: Init
    public init() { }
    
    public init<S>(vertices: S) where S: Sequence, S.Element == Element {
        
    }
    
    public init(edges: ListMiniUndirectedEdge<Element, Weight>.Tuple...) {
        
    }
    
    public init(edges: ListMiniUndirectedEdge<Element, Weight>...) {
        
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight> {
        
    }
    
    public init<S>(edges: S) where S : Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>.Tuple {
        
    }
    
}

// MARK: ListWeightedMutilSigraphProtocol.Vertex
extension ListMutilSigraph {

    public var vertexCount: Int { vertices.count }
    
    public func inDegrees(byVertex vertex: Element) -> Int {
        0
    }
    
    public func outDegrees(byVertex vertex: Element) -> Int {
        0
    }
    
    @discardableResult
    public mutating func add(vertex: Element) -> Vertex? {
        nil
    }
    
    @discardableResult
    public mutating func add<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element {
        []
    }
    
    @discardableResult
    public mutating func remove(vertex: Element) -> Vertex? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element {
        []
    }
    
    @discardableResult
    public mutating func replace(vertex: Element, with new: Element) -> ReplaceVertexTuple? {
        nil
    }
    
}

// MARK: ListWeightedMutilSigraphProtocol.Edge
extension ListMutilSigraph {
    
    public var edgeCount: Int { edges.count }
    
    @discardableResult
    public mutating func add(edgeInVertex1 vertex1: Element, vertex2: Element, weight: Weight) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(edgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(edgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S : Sequence, S.Element == (vertex1: Self.Element, vertex2: Self.Element, weight: Self.Weight) {
        []
    }
    
    @discardableResult
    public mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S : Sequence, S.Element == ListMiniUndirectedEdge<Self.Element, Self.Weight> {
        []
    }
    
    @discardableResult
    public mutating func remove(edgeByVertex1 vertex1: Element, vertex2: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S : Sequence, S.Element == (vertex1: Self.Element, vertex2: Self.Element) {
        []
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S : Sequence, S.Element == ListUndirectedVertexPair<Self.Element> {
        []
    }
    
    @discardableResult
    public mutating func replace(edgeWeightByVertex1 vertex1: Element, vertex2: Element, newWeight: Weight) -> ReplaceWeightTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeWeightByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, newWeight: Weight) -> ReplaceWeightTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeWeightByVertexPair vertexPair: ListUndirectedVertexPair<Element>, newWeight: Weight) -> ReplaceWeightTuple? {
        nil
    }
    
    @discardableResult
    public mutating func add(selfLoopEdgeInVertex vertex: Element, withWeight weight: Weight) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(selfLoopEdgeInVertices vertices: (vertex: Element, weight: Weight)...) -> [Edge] {
        []
    }
    
    @discardableResult
    public mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(selfLoopEdgeByVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element {
        []
    }
    
    @discardableResult
    public mutating func replace(selfLoopEdgeWeightInVertex vertex: Element, with newWeight: Weight) -> ReplaceWeightTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>) -> ReplaceEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, withNewMiniEdge newMiniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) -> ReplaceEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>, withNewMiniEdge newMiniEdge: ListMiniUndirectedEdge<Element, Weight>) -> ReplaceEdgeTuple? {
        nil
    }

}

/// - Tag: ListGraphProtocol
extension ListMutilSigraph {
    
    /// - Tag: Traversal
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
    
    /// - Tag: Components
    public func components() -> UnionFind<Element> {
        .init()
    }
    
    /// - Tag: Topological Sort
    public func topologicalSort() -> [Element] {
        []
    }
    
    /// - Tag: Minimum Spanning Tree
    public func prim() -> Set<EdgeInfo> {
        .init()
    }
    
    public func kruskal() -> Set<EdgeInfo> {
        .init()
    }
    
    /// - Tag: Shortest Path
    /// Support negative weight edge, can detect whether there is a negative weight cycle.
    public func bellmanFordShortestPath(begin: Element) -> [Element: PathInfo] {
        [:]
    }
    
    /// Negative edge weights are not supported.
    public func dijkstraShortestPath(begin: Element) -> [Element: PathInfo] {
        [:]
    }
    
    public func floydShortestPath() -> [Element: [Element: PathInfo]] {
        [:]
    }

    public func bidirectionalShortestPath(begin: Element, end: Element) -> PathInfo? {
        nil
    }
    
}


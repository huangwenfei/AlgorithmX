//
//  ListMutilDigraph.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/18.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public typealias DWLGraph = ListMutilDigraph

/** Directed MultiGraph
 */

public struct ListUnweightedMutilDigraph<Element: ListGraphVertexable>: ListUnweightedMutilDigraphProtocol {

    public typealias Element = Element
    public typealias Weight = ListUnweighted
    
    public typealias Edge = ListDirectedEdge<Element, Weight>
    public typealias Vertex = ListVertex<Element>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    /// - Tag: Directed & Mutil & Weighted
    public var isDirected: Bool { true }
    public var isMutil: Bool { true }
    public var isWeighted: Bool { false }
    
    /// - Tag: Init
    public init() { }
    
    public init<S>(vertices: S) where S: Sequence, S.Element == Element {
        
    }
    
    public init(edges: ListDirectedVertexPair<Element>.Tuple...) {
        
    }
    
    public init(edges: ListDirectedVertexPair<Element>...) {
        
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple {
        
    }
    
    public init<S>(edges: S) where S : Sequence, S.Element == ListDirectedVertexPair<Element> {
        
    }
    
}

// MARK: ListUnweightedMutilDigraphProtocol.Vertex
extension ListUnweightedMutilDigraph {
    
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

// MARK: ListUnweightedMutilDigraphProtocol.Edge
extension ListUnweightedMutilDigraph {
    
    public var edgeCount: Int { edges.count }
    
    @discardableResult
    public mutating func add(edgeFrom from: Element, to: Element) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func add<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S : Sequence, S.Element == (from: Self.Element, to: Self.Element) {
        []
    }
    
    @discardableResult
    public mutating func add<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S : Sequence, S.Element == ListDirectedVertexPair<Self.Element> {
        []
    }
    
    @discardableResult
    public mutating func remove(edgeByFrom from: Element, to: Element) -> Edge? {
        nil
    }

    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) -> Edge? {
        nil
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S : Sequence, S.Element == (from: Self.Element, to: Self.Element) {
        []
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S : Sequence, S.Element == ListDirectedVertexPair<Self.Element> {
        []
    }
    
    @discardableResult
    public mutating func add(selfLoopEdgeInVertex vertex: Element) -> Edge? {
        nil
    }

    @discardableResult
    public mutating func add<S>(selfLoopEdgeInVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element {
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
    public mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple? {
        nil
    }

    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>) -> ReplaceEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func add(doubleSideEdgeInVertex1 vertex1: Element, vertex2: Element) -> DoubleSideEdgeTuple? {
        nil
    }

    @discardableResult
    public mutating func add(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> DoubleSideEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func add(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> DoubleSideEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func remove(doubleSideEdgeInVertex1 vertex1: Element, vertex2: Element) -> DoubleSideEdgeTuple? {
        nil
    }
    
    @discardableResult
    public mutating func remove(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> DoubleSideEdgeTuple? {
        nil
    }

    @discardableResult
    public mutating func remove(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> DoubleSideEdgeTuple? {
        nil
    }
    
}

// MARK: ListUnweightedMutilDigraphProtocol
extension ListUnweightedMutilDigraph {
    
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

// MARK: ListMutilDigraph
public struct ListMutilDigraph<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListWeightedMutilDigraphProtocol {

    public typealias Element = Element
    public typealias Weight = Weight
    
    public typealias Edge = ListDirectedEdge<Element, Weight>
    public typealias Vertex = ListVertex<Element>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    /// - Tag: Directed & Mutil & Weighted
    public var isDirected: Bool { true }
    public var isMutil: Bool { true }
    public var isWeighted: Bool { Weight.self != ListUnweighted.self }
    
    /// - Tag: Init
    public init() { }
    
    public init<S>(vertices: S) where S: Sequence, S.Element == Element {
        
    }
    
    public init(edges: ListMiniDirectedEdge<Element, Weight>.Tuple...) {
        
    }
    
    public init(edges: ListMiniDirectedEdge<Element, Weight>...) {
        
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>.Tuple {
        
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight> {
        
    }
    
}

// MARK: ListWeightedMutilDigraphProtocol.Vertex
extension ListMutilDigraph {
    
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

// MARK: ListWeightedMutilDigraphProtocol.Edge
extension ListMutilDigraph {
    
    public var edgeCount: Int { edges.count }
    
    public mutating func add(edgeByFrom from: Element, to: Element, weight: Weight) {
        
    }
    
    public mutating func add(edgeByMiniEdge miniEdge: ListMiniDirectedEdge<Element, Weight>.Tuple) {
        add(
            edgeByFrom: miniEdge.from, to: miniEdge.to, weight: miniEdge.weight
        )
    }
    
    public mutating func add(edgeByMiniEdge miniEdge: ListMiniDirectedEdge<Element, Weight>) {
        add(
            edgeByFrom: miniEdge.from, to: miniEdge.to, weight: miniEdge.weight
        )
    }
    
    public mutating func add<S>(edgesByMiniEdges miniEdges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>.Tuple {
        for tuple in miniEdges {
            add(edgeByFrom: tuple.from, to: tuple.to, weight: tuple.weight)
        }
    }
    
    public mutating func add<S>(edgesByMiniEdges miniEdges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight> {
        for edge in miniEdges {
            add(edgeByFrom: edge.from, to: edge.to, weight: edge.weight)
        }
    }
    
    public mutating func remove(edgeByFrom from: Element, to: Element) {

    }
    
    public mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) {
        remove(edgeByFrom: vertexPair.from, to: vertexPair.to)
    }
    
    public mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) {
        remove(edgeByFrom: vertexPair.from, to: vertexPair.to)
    }
    
    public mutating func remove<S>(edgesByVertexPairs vertexPairs: S) where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple {
        for vertexPair in vertexPairs {
            remove(edgeByFrom: vertexPair.from, to: vertexPair.to)
        }
    }
    
    public mutating func remove<S>(edgesByVertexPairs vertexPairs: S) where S: Sequence, S.Element == ListDirectedVertexPair<Element> {
        for vertexPair in vertexPairs {
            remove(edgeByFrom: vertexPair.from, to: vertexPair.to)
        }
    }
    
    
    public mutating func add(selfLoopEdgeInVertex vertex: Element, withWeight weight: Weight) {
        
    }
    
    public mutating func add(selfLoopEdgeInVertices vertices: (vertex: Element, weight: Weight)...) {
        
    }
    
    public mutating func remove(selfLoopEdgeByVertex vertex: Element) {
        
    }
    
    public mutating func remove<S>(selfLoopEdgeByVertices vertices: S) where S: Sequence, S.Element == Element {
        
    }
    
    public mutating func replace(selfLoopEdgeWeightInVertex vertex: Element, with newWeight: Weight) {
        
    }

    
    public mutating func replace(edgeWeightByFrom from: Element, to: Element, newWeight: Weight) {
        
    }
    
    public mutating func replace(edgeWeightByVertexPair vertexPair: ListDirectedVertexPair<Element>, newWeight: Weight) {
        
    }
    
    public mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>.Tuple) {
        
    }
    
    public mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>) {
        
    }
    

    public mutating func add(doubleSideEdgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) {
        
    }
    
    public mutating func add(doubleSideEdgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>) {
        
    }
    
    public mutating func add<S>(doubleSideEdgesByMiniEdges miniEdges: S) where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>.Tuple {
        
    }
    
    public mutating func add<S>(doubleSideEdgesByMiniEdges miniEdges: S) where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight> {
        
    }
    
    public mutating func remove(doubleSideEdgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) {
        
    }
    
    public mutating func remove(doubleSideEdgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) {
        
    }
    
    public mutating func remove<S>(doubleSideEdgesByVertexPairs vertexPairs: S) where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple {
        
    }
    
    public mutating func remove<S>(doubleSideEdgesByVertexPairs vertexPairs: S) where S: Sequence, S.Element == ListUndirectedVertexPair<Element> {
        
    }
    
}

// MARK: ListWeightedMutilDigraphProtocol
extension ListMutilDigraph {
    
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

//
//  ListGraphProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/19.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

// MARK: Common
public protocol ListGraphProtocol {
    
    associatedtype Element: ListGraphVertexable
    associatedtype Weight: ListGraphWeightable
    
    associatedtype Vertex
    associatedtype Edge
    
    /// - Tag: Directed & Mutil & Weighted
    var isDirected: Bool { get }
    var isMutil: Bool { get }
    var isWeighted: Bool { get }
    
    /// - Tag: Init
    init()
    init<S>(vertices: S) where S: Sequence, S.Element == Element
    
    /// - Tag: Vertex
    var vertexCount: Int { get }
    
    func inDegrees(byVertex vertex: Element) -> Int
    func outDegrees(byVertex vertex: Element) -> Int
    
    @discardableResult
    mutating func add(vertex: Element) -> Vertex?
    
    @discardableResult
    mutating func add<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element
    
    @discardableResult
    mutating func remove(vertex: Element) -> Vertex?
    
    @discardableResult
    mutating func remove<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element
    
    typealias ReplaceVertexTuple = (old: Vertex, new: Vertex)
    @discardableResult
    mutating func replace(vertex: Element, with new: Element) -> ReplaceVertexTuple?
    
    /// - Tag: Edge
    var edgeCount: Int { get }
    
    typealias ReplaceWeightTuple = (old: Weight, new: Weight)
    typealias ReplaceEdgeTuple = (old: Edge, new: Edge)
    typealias DoubleSideEdgeTuple = (fromTo: Edge, toFrom: Edge)
    
    /// - Tag: Traversal
    func breadthFirstSearch(begin beginData: Element) -> [Element]
    func depthFirstSearch(begin beginData: Element) -> [Element]
    
    func breadthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool)
    func depthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool)
    
    /// - Tag: Components
    func components() -> UnionFind<Element>
    
    /// - Tag: Topological Sort
    /// Activity On Edge Network (AOE) (https://ithelp.ithome.com.tw/articles/10207076)
    /// Activity On Vertex Network (AOV) 必须是有向无环图
    func topologicalSort() -> [Element]
    
    /// - Tag: Minimum Spanning Tree
    /// 有权有向图
    typealias EdgeInfo = ListEdgeInfo<Element, Weight>
    func prim() -> Set<EdgeInfo>
    func kruskal() -> Set<EdgeInfo>
    
    /// - Tag: Shortest Path
    typealias PathInfo = ListPathInfo<Element, Weight>
    /// Support negative weight edge, can detect whether there is a negative weight cycle.
    func bellmanFordShortestPath(begin: Element) -> [Element: PathInfo]
    
    /// Negative edge weights are not supported.
    func dijkstraShortestPath(begin: Element) -> [Element: PathInfo]
    
    /// Support negative weight edge, can detect whether there is a negative weight cycle.
    func floydShortestPath() -> [Element: [Element: PathInfo]]
    
    func bidirectionalShortestPath(begin: Element, end: Element) -> PathInfo?
    
}

// MARK: Sigraph
public protocol ListSigraphProtocol: ListGraphProtocol {
    
    
}

public protocol ListUnweightedSigraphProtocol: ListSigraphProtocol {
    
    /// - Tag: Init
    init(edges: ListUndirectedVertexPair<Element>.Tuple...)
    init<S>(edges: S) where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple
    init(edges: ListUndirectedVertexPair<Element>...)
    init<S>(edges: S) where S: Sequence, S.Element == ListUndirectedVertexPair<Element>
    
    /// - Tag: Edge
    @discardableResult
    mutating func add(edgeInVertex1 vertex1: Element, vertex2: Element) -> Edge?
    
    @discardableResult
    mutating func add(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> Edge?
    
    @discardableResult
    mutating func add(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> Edge?
    
    @discardableResult
    mutating func add<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func add<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>
    
    
    @discardableResult
    mutating func remove(edgeByVertex1 vertex1: Element, vertex2: Element) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> Edge?
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>
    
    
    @discardableResult
    mutating func add(selfLoopEdgeInVertex vertex: Element) -> Edge?
    
    @discardableResult
    mutating func add<S>(selfLoopEdgeInVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element
    
    
    @discardableResult
    mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge?
    
    @discardableResult
    mutating func remove<S>(selfLoopEdgeInVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element
    
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>) -> ReplaceEdgeTuple?
    
}

public protocol ListWeightedSigraphProtocol: ListSigraphProtocol {
    
    /// - Tag: Init
    init(edges: ListMiniUndirectedEdge<Element, Weight>.Tuple...)
    init(edges: ListMiniUndirectedEdge<Element, Weight>...)
    init<S>(edges: S) where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>.Tuple
    init<S>(edges: S) where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>
    
    /// - Tag: Edge
    @discardableResult
    mutating func add(edgeInVertex1 vertex1: Element, vertex2: Element, weight: Weight) -> Edge?
    
    @discardableResult
    mutating func add(edgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) -> Edge?
    
    @discardableResult
    mutating func add(edgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>) -> Edge?
    
    @discardableResult
    mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>.Tuple
    
    @discardableResult
    mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>
    
    
    @discardableResult
    mutating func remove(edgeByVertex1 vertex1: Element, vertex2: Element) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> Edge?
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPair vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>
    
    
    @discardableResult
    mutating func replace(edgeWeightByVertex1 vertex1: Element, vertex2: Element, newWeight: Weight) -> ReplaceWeightTuple?
    
    @discardableResult
    mutating func replace(edgeWeightByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, newWeight: Weight) -> ReplaceWeightTuple?
    
    @discardableResult
    mutating func replace(edgeWeightByVertexPair vertexPair: ListUndirectedVertexPair<Element>, newWeight: Weight) -> ReplaceWeightTuple?
    
    
    @discardableResult
    mutating func add(selfLoopEdgeInVertex vertex: Element, withWeight weight: Weight) -> Edge?
    
    @discardableResult
    mutating func add(selfLoopEdgeInVertices vertices: (vertex: Element, weight: Weight)...) -> [Edge]
    
    
    @discardableResult
    mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge?
    
    @discardableResult
    mutating func remove<S>(selfLoopEdgeByVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element
    
    @discardableResult
    mutating func replace(selfLoopEdgeWeightInVertex vertex: Element, with newWeight: Weight) -> ReplaceWeightTuple?

    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListUndirectedVertexPair<Element>) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple, withNewMiniEdge newMiniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>, withNewMiniEdge newMiniEdge: ListMiniUndirectedEdge<Element, Weight>) -> ReplaceEdgeTuple?
    
}

// MARK: Digraph
public protocol ListDigraphProtocol: ListGraphProtocol {
    
}

public protocol ListUnweightedDigraphProtocol: ListDigraphProtocol {
    
    /// - Tag: Init
    init(edges: ListDirectedVertexPair<Element>.Tuple...)
    init(edges: ListDirectedVertexPair<Element>...)
    init<S>(edges: S) where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple
    init<S>(edges: S) where S: Sequence, S.Element == ListDirectedVertexPair<Element>
    
    /// - Tag: Edge
    @discardableResult
    mutating func add(edgeFrom from: Element, to: Element) -> Edge?
    
    @discardableResult
    mutating func add(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) -> Edge?
    
    @discardableResult
    mutating func add(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) -> Edge?
    
    @discardableResult
    mutating func add<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func add<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>
    
    @discardableResult
    mutating func remove(edgeByFrom from: Element, to: Element) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) -> Edge?
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>
    
    @discardableResult
    mutating func add(selfLoopEdgeInVertex vertex: Element) -> Edge?
    
    @discardableResult
    mutating func add<S>(selfLoopEdgeInVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element
    
    @discardableResult
    mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge?
    
    @discardableResult
    mutating func remove<S>(selfLoopEdgeByVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func add(doubleSideEdgeInVertex1 vertex1: Element, vertex2: Element) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func add(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func add(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func remove(doubleSideEdgeInVertex1 vertex1: Element, vertex2: Element) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func remove(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func remove(doubleSideEdgeInVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> DoubleSideEdgeTuple?
    
}

public protocol ListWeightedDigraphProtocol: ListDigraphProtocol {
    
    /// - Tag: Init
    init(edges: ListMiniDirectedEdge<Element, Weight>.Tuple...)
    init(edges: ListMiniDirectedEdge<Element, Weight>...)
    init<S>(edges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>.Tuple
    init<S>(edges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>
    
    /// - Tag: Edge
    @discardableResult
    mutating func add(edgeByFrom from: Element, to: Element, weight: Weight) -> Edge?
    
    @discardableResult
    mutating func add(edgeByMiniEdge miniEdge: ListMiniDirectedEdge<Element, Weight>.Tuple) -> Edge?
    
    @discardableResult
    mutating func add(edgeByMiniEdge miniEdge: ListMiniDirectedEdge<Element, Weight>) -> Edge?
    
    @discardableResult
    mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>.Tuple
    
    @discardableResult
    mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>
    
    @discardableResult
    mutating func remove(edgeByFrom from: Element, to: Element) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) -> Edge?
    
    @discardableResult
    mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) -> Edge?
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>
    
    @discardableResult
    mutating func add(selfLoopEdgeInVertex vertex: Element, withWeight weight: Weight) -> Edge?
    
    @discardableResult
    mutating func add(selfLoopEdgeInVertices vertices: (vertex: Element, weight: Weight)...) -> [Edge]
    
    @discardableResult
    mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge?
    
    @discardableResult
    mutating func remove<S>(selfLoopEdgeByVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element
    
    
    @discardableResult
    mutating func replace(selfLoopEdgeWeightInVertex vertex: Element, with newWeight: Weight) -> ReplaceWeightTuple?
    
    @discardableResult
    mutating func replace(edgeWeightByFrom from: Element, to: Element, newWeight: Weight) -> ReplaceWeightTuple?
    
    @discardableResult
    mutating func replace(edgeWeightByVertexPair vertexPair: ListDirectedVertexPair<Element>, newWeight: Weight) -> ReplaceWeightTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple?
    
    @discardableResult
    mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>) -> ReplaceEdgeTuple?

    @discardableResult
    mutating func add(doubleSideEdgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func add(doubleSideEdgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func add<S>(doubleSideEdgesByMiniEdges miniEdges: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>.Tuple
    
    @discardableResult
    mutating func add<S>(doubleSideEdgesByMiniEdges miniEdges: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>
    
    @discardableResult
    mutating func remove(doubleSideEdgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func remove(doubleSideEdgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> DoubleSideEdgeTuple?
    
    @discardableResult
    mutating func remove<S>(doubleSideEdgesByVertexPairs vertexPairs: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple
    
    @discardableResult
    mutating func remove<S>(doubleSideEdgesByVertexPairs vertexPairs: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>
    
}

// MARK: MutilSigraph
public protocol ListMutilSigraphProtocol: ListGraphProtocol {
    
}

/// As same as ListUnweightedSigraphProtocol
public protocol ListUnweightedMutilSigraphProtocol: ListMutilSigraphProtocol {
    
}

public protocol ListWeightedMutilSigraphProtocol: ListMutilSigraphProtocol {
    
}

// MARK: MutilDigraph
public protocol ListMutilDigraphProtocol: ListGraphProtocol {
    
}

public protocol ListUnweightedMutilDigraphProtocol: ListMutilDigraphProtocol {
    
    
}

public protocol ListWeightedMutilDigraphProtocol: ListMutilDigraphProtocol {
    
 
}

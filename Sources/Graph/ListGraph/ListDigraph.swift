//
//  ListDigraph.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/18.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public typealias UWLGraph = ListDigraph

/** Directed Graph
 */

public struct ListUnweightedDigraph<Element: ListGraphVertexable>: ListUnweightedDigraphProtocol {
    
    public typealias Element = Element
    public typealias Weight = ListUnweighted
    
    public typealias Edge = ListDirectedEdge<Element, Weight>
    public typealias Vertex = ListVertex<Element>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    /// - Tag: Directed & Mutil & Weighted
    public var isDirected: Bool { true }
    public var isMutil: Bool { false }
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

//MARK: ListUnweightedDigraphProtocol.Vertex
extension ListUnweightedDigraph {
    
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

// MARK: ListUnweightedDigraphProtocol.Edge
extension ListUnweightedDigraph {
    
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

// MARK: ListUnweightedDigraphProtocol
extension ListUnweightedDigraph {
    
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

// MARK: - ListDigraph
public struct ListDigraph<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListWeightedDigraphProtocol {

    public typealias Element = Element
    public typealias Weight = Weight
    
    public typealias Edge = ListDirectedEdge<Element, Weight>
    public typealias Vertex = ListVertex<Element>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    private typealias InOutEdges = [Vertex: Set<Edge>]
    private var vertexInEdges: InOutEdges = [:]
    private var vertexOutEdges: InOutEdges = [:]
    
    /// - Tag: Directed & Mutil & Weighted
    public var isDirected: Bool { true }
    public var isMutil: Bool { false }
    public var isWeighted: Bool { Weight.self != ListUnweighted.self }
    
    /// - Tag: Init
    public init() { }
    
    public init<S>(vertices: S) where S: Sequence, S.Element == Element {
        add(vertices: vertices)
    }
    
    public init(edges: ListMiniDirectedEdge<Element, Weight>.Tuple...) {
        add(edgesByMiniEdges: edges)
    }
    
    public init(edges: ListMiniDirectedEdge<Element, Weight>...) {
        add(edgesByMiniEdges: edges)
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>.Tuple {
        add(edgesByMiniEdges: edges)
    }
    
    public init<S>(edges: S) where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight> {
        add(edgesByMiniEdges: edges)
    }
     
}

//MARK: CustomDebugStringConvertible
extension ListDigraph: CustomStringConvertible, CustomDebugStringConvertible {
    
    private func nilEdge(_ e: Set<Edge>?, isDebug: Bool = true) -> String {
        e == nil ? "nil" : edgesStr(e!, isDebug: isDebug)
    }
    
    private func edgesStr(_ e: Set<Edge>, isDebug: Bool = true, usingEnter: Bool = false) -> String {
        var str = ""
        var iter = e.makeIterator()
        while let edge = iter.next() {
            str += isDebug ? " " : ""
            str += (isDebug ? edge.debugDescription : edge.description)
            str += usingEnter ? "\n" : ", "
        }
        return usingEnter ? str : .init(str.dropLast(", ".count))
    }
    
    public var description: String {
        var str = "||| Graph: \n"
        str += "[ Vertex ]: "
    
        vertices.forEach {
            str += "{"
            str += " · \($0) · "
            str += ", @out: "
            str += nilEdge(vertexOutEdges[$1], isDebug: false)
            str += "; @in: "
            str += nilEdge(vertexInEdges[$1], isDebug: false)
            str += " }, "
        }
        
        str = .init(str.dropLast(", ".count))

        str += "\n\n"
        
        str += "[ Edge ]: { "
        str += edgesStr(edges, isDebug: false, usingEnter: false) + " }"
        
        str += "\n"
        
        return str
    }
    
    public var debugDescription: String {
        var str = "||| Graph: \n"
        str += "\n******************** [ Vertex ] ********************\n"
        vertices.forEach {
            str += " \n · \($0) · \n"
            str += "----------- Out Edges -----------\n"
            str += nilEdge(vertexOutEdges[$1]) + "\n\n"
            str += "----------- In Edges -----------\n"
            str += nilEdge(vertexInEdges[$1]) + "\n"
        }

        str += "\n******************** [ Edge ] ********************\n"
        str += edgesStr(edges, usingEnter: true)
        
        return str
    }
    
}

// MARK: Reverse
extension ListDigraph {
    
    public var reverse: Self {
        var result = self
        result.edges = .init(edges.map { $0.reverse })
        result.vertexInEdges = vertexInEdges.mapValues {
            .init($0.map { $0.reverse })
        }
        result.vertexOutEdges = vertexOutEdges.mapValues {
            .init($0.map { $0.reverse })
        }
        return result
    }
    
}

//MARK: ListWeightedDigraphProtocol.Vertex
extension ListDigraph {
    
    public var vertexCount: Int { vertices.count }
    
    public func inDegrees(byVertex vertex: Element) -> Int {
        guard let vertexKey = vertices[vertex] else { return 0 }
        return vertexInEdges[vertexKey]?.count ?? 0
    }
    
    public func outDegrees(byVertex vertex: Element) -> Int {
        guard let vertexKey = vertices[vertex] else { return 0 }
        return vertexOutEdges[vertexKey]?.count ?? 0
    }
    
    @discardableResult
    public mutating func add(vertex: Element) -> Vertex? {
        guard vertices[vertex] == nil else { return nil }
        vertices[vertex] = .init(data: vertex)
        return vertices[vertex]!
    }
    
    @discardableResult
    public mutating func add<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element {
        var result = [Vertex]()
        vertices.forEach {
            if let vertex = add(vertex: $0) { result.append(vertex) }
        }
        return result
    }
    
    @discardableResult
    public mutating func remove(vertex: Element) -> Vertex? {
        guard let vertexKey = vertices[vertex] else { return nil }
        
        var iterator = vertexOutEdges[vertexKey]?.makeIterator()
        while let edge = iterator?.next() {
            vertexInEdges[edge.to]?.remove(edge)
            edges.remove(edge)
        }
        vertexOutEdges[vertexKey] = nil
        
        iterator = vertexInEdges[vertexKey]?.makeIterator()
        while let edge = iterator?.next() {
            vertexOutEdges[edge.from]?.remove(edge)
            edges.remove(edge)
        }
        vertexInEdges[vertexKey] = nil
        
        vertices[vertex] = nil
        
        return vertexKey
    }
    
    @discardableResult
    public mutating func remove<S>(vertices: S) -> [Vertex] where S: Sequence, S.Element == Element {
        var result = [Vertex]()
        vertices.forEach {
            if let vertex = remove(vertex: $0) { result.append(vertex) }
        }
        return result
    }
    
    @discardableResult
    public mutating func replace(vertex: Element, with new: Element) -> ReplaceVertexTuple? {
        guard vertex != new else { return nil }
        guard vertices[new] == nil else { return nil }
        guard let vertexKey = vertices[vertex] else { return nil }

        /// - Tag: Set new from vertex
        add(vertex: new)
        
        let oldInEdges = vertexInEdges[vertexKey]
        let oldOutEdges = vertexOutEdges[vertexKey]
        
        let newVertex = vertices[new]!
        vertexInEdges[newVertex] = {
            var result = Set<Edge>()
            var iter = oldInEdges?.makeIterator()
            while var edge = iter?.next() {
                edges.remove(edge)
                edge.isSelfLoop
                    ? { edge.from = newVertex ; edge.to = newVertex }()
                    : ( edge.to = newVertex )
                result.insert(edge)
                edges.insert(edge)
            }
            return result
        }()
        
        vertexOutEdges[newVertex] = {
            var result = Set<Edge>()
            var iter = oldOutEdges?.makeIterator()
            while var edge = iter?.next() {
                edges.remove(edge)
                edge.isSelfLoop
                    ? { edge.from = newVertex ; edge.to = newVertex }()
                    : ( edge.from = newVertex )
                result.insert(edge)
                edges.insert(edge)
            }
            return result
        }()
        
        /// - Tag: Clean vertex
        vertices[vertex] = nil
        vertexInEdges[vertexKey] = nil
        vertexOutEdges[vertexKey] = nil
        
        return (vertexKey, newVertex)
    }
    
}

// MARK: ListWeightedDigraphProtocol.Edge
extension ListDigraph {
    
    public var edgeCount: Int { edges.count }
    
    @discardableResult
    public mutating func add(edgeByFrom from: Element, to: Element, weight: Weight) -> Edge? {
        
        add(vertex: from)
        add(vertex: to)
        
        remove(edgeByFrom: from, to: to)
        
        let fromVertex = vertices[from]!
        let toVertex = vertices[to]!
        
        if vertexOutEdges[fromVertex] == nil {
            vertexOutEdges[fromVertex] = []
        }
        
        if vertexInEdges[toVertex] == nil {
            vertexInEdges[toVertex] = []
        }
        
        let edge: Edge = .init(from: fromVertex, to: toVertex, weight: weight)
        
        vertexOutEdges[fromVertex]?.insert(edge)
        vertexInEdges[toVertex]?.insert(edge)
        edges.insert(edge)
        
        return edge
    }
    
    @discardableResult
    public mutating func add(edgeByMiniEdge miniEdge: ListMiniDirectedEdge<Element, Weight>.Tuple) -> Edge? {
        add(
            edgeByFrom: miniEdge.from, to: miniEdge.to, weight: miniEdge.weight
        )
    }
    
    @discardableResult
    public mutating func add(edgeByMiniEdge miniEdge: ListMiniDirectedEdge<Element, Weight>) -> Edge? {
        add(
            edgeByFrom: miniEdge.from, to: miniEdge.to, weight: miniEdge.weight
        )
    }
    
    @discardableResult
    public mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight>.Tuple {
        
        var result = [Edge]()
        miniEdges.forEach {
            if let edge = add(
                edgeByFrom: $0.from, to: $0.to, weight: $0.weight
            ) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func add<S>(edgesByMiniEdges miniEdges: S) -> [Edge] where S: Sequence, S.Element == ListMiniDirectedEdge<Element, Weight> {
        
        var result = [Edge]()
        miniEdges.forEach {
            if let edge = add(
                edgeByFrom: $0.from, to: $0.to, weight: $0.weight
            ) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func remove(edgeByFrom from: Element, to: Element) -> Edge? {
        guard let fromVertex = vertices[from] else { return nil }
        guard let toVertex = vertices[to] else { return nil }
        
        /// Unweighted
        guard isWeighted else {
            let edge: Edge = .init(
                from: fromVertex,
                to: toVertex,
                weight: ListUnweighted() as! Weight
            )
            var haveEdge: Bool = false
            if (vertexOutEdges[fromVertex]?.remove(edge)) != nil {
                vertexInEdges[toVertex]?.remove(edge)
                edges.remove(edge)
                haveEdge = true
            }
            return haveEdge ? edge : nil
        }
        
        /// Weighted
        guard let edge = findEdge(byFrom: fromVertex, to: toVertex) else {
            return nil
        }
        
        vertexOutEdges[fromVertex]?.remove(edge)
        vertexInEdges[toVertex]?.remove(edge)
        edges.remove(edge)
        
        return edge
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple) -> Edge? {
        remove(edgeByFrom: vertexPair.from, to: vertexPair.to)
    }
    
    @discardableResult
    public mutating func remove(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>) -> Edge? {
        remove(edgeByFrom: vertexPair.from, to: vertexPair.to)
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element>.Tuple {
        
        var result = [Edge]()
        vertexPairs.forEach {
            if let edge = remove(edgeByFrom: $0.from, to: $0.to) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func remove<S>(edgesByVertexPairs vertexPairs: S) -> [Edge] where S: Sequence, S.Element == ListDirectedVertexPair<Element> {
        
        var result = [Edge]()
        vertexPairs.forEach {
            if let edge = remove(edgeByFrom: $0.from, to: $0.to) {
                result.append(edge)
            }
        }
        return result
    }
    
    
    @discardableResult
    public mutating func add(selfLoopEdgeInVertex vertex: Element, withWeight weight: Weight) -> Edge? {
        
        add(edgeByFrom: vertex, to: vertex, weight: weight)
    }
    
    @discardableResult
    public mutating func add(selfLoopEdgeInVertices vertices: (vertex: Element, weight: Weight)...) -> [Edge] {
        
        var result = [Edge]()
        vertices.forEach {
            if let edge = add(
                selfLoopEdgeInVertex: $0.vertex, withWeight: $0.weight
            ) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func remove(selfLoopEdgeByVertex vertex: Element) -> Edge? {
        remove(edgeByFrom: vertex, to: vertex)
    }
    
    @discardableResult
    public mutating func remove<S>(selfLoopEdgeByVertices vertices: S) -> [Edge] where S: Sequence, S.Element == Element {
        
        var result = [Edge]()
        vertices.forEach {
            if let edge = remove(selfLoopEdgeByVertex: $0) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func replace(selfLoopEdgeWeightInVertex vertex: Element, with newWeight: Weight) -> ReplaceWeightTuple? {
        guard let vertexKey = vertices[vertex] else { return nil }
        
        let oldInEdges = vertexInEdges[vertexKey]
        let oldOutEdges = vertexOutEdges[vertexKey]
        
        var oldWeight: Weight? = nil
        vertexInEdges[vertexKey] = {
            var result = Set<Edge>()
            var iter = oldInEdges?.makeIterator()
            while var edge = iter?.next() {
                guard edge.isSelfLoop else { continue }
                edges.remove(edge)
                oldWeight = edge.weight
                edge.weight = newWeight
                result.insert(edge)
                edges.insert(edge)
            }
            return result
        }()
        
        vertexOutEdges[vertexKey] = {
            var result = Set<Edge>()
            var iter = oldOutEdges?.makeIterator()
            while var edge = iter?.next() {
                guard edge.isSelfLoop else { continue }
                edges.remove(edge)
                oldWeight = edge.weight
                edge.weight = newWeight
                result.insert(edge)
                edges.insert(edge)
            }
            return result
        }()
        
        return oldWeight == nil ? nil : (oldWeight!, newWeight)
    }

    
    @discardableResult
    public mutating func replace(edgeWeightByFrom from: Element, to: Element, newWeight: Weight) -> ReplaceWeightTuple? {
        guard let oldEdge = remove(edgeByFrom: from, to: to) else {
            return nil
        }
        
        add(edgeByFrom: from, to: to, weight: newWeight)
        
        return (oldEdge.weight, newWeight)
    }
    
    @discardableResult
    public mutating func replace(edgeWeightByVertexPair vertexPair: ListDirectedVertexPair<Element>, newWeight: Weight) -> ReplaceWeightTuple? {
        
        replace(
            edgeWeightByFrom: vertexPair.from,
            to: vertexPair.to,
            newWeight: newWeight
        )
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>.Tuple, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>.Tuple) -> ReplaceEdgeTuple? {
        
        guard let oldEdge = remove(
                edgeByFrom: vertexPair.from, to: vertexPair.to
        ) else {
            return nil
        }
        
        guard let newEdge = add(
            edgeByFrom: newVertexPair.from,
            to: newVertexPair.to,
            weight: oldEdge.weight
        ) else {
            return nil
        }
        
        return (oldEdge, newEdge)
    }
    
    @discardableResult
    public mutating func replace(edgeByVertexPair vertexPair: ListDirectedVertexPair<Element>, withNewVertexPair newVertexPair: ListDirectedVertexPair<Element>) -> ReplaceEdgeTuple? {
        
        replace(
            edgeByVertexPair: (vertexPair.from, vertexPair.to),
            withNewVertexPair: (newVertexPair.from, newVertexPair.to)
        )
    }
    

    @discardableResult
    public mutating func add(doubleSideEdgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>.Tuple) -> DoubleSideEdgeTuple? {
        
        guard let fromTo = add(
            edgeByFrom: miniEdge.vertex1,
            to: miniEdge.vertex2,
            weight: miniEdge.weight
        ) else {
            return nil
        }
        
        guard let toFrom = add(
            edgeByFrom: miniEdge.vertex2,
            to: miniEdge.vertex1,
            weight: miniEdge.weight
        ) else {
            return nil
        }
        
        return (fromTo, toFrom)
    }

    @discardableResult
    public mutating func add(doubleSideEdgeByMiniEdge miniEdge: ListMiniUndirectedEdge<Element, Weight>) -> DoubleSideEdgeTuple? {
        
        guard let fromTo = add(
            edgeByFrom: miniEdge.uFrom,
            to: miniEdge.uTo,
            weight: miniEdge.weight
        ) else {
            return nil
        }
        
        guard let toFrom = add(
            edgeByFrom: miniEdge.vFrom,
            to: miniEdge.vTo,
            weight: miniEdge.weight
        ) else {
            return nil
        }
        
        return (fromTo, toFrom)
    }
    
    @discardableResult
    public mutating func add<S>(doubleSideEdgesByMiniEdges miniEdges: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight>.Tuple {
        
        var result = [DoubleSideEdgeTuple]()
        miniEdges.forEach {
            if let edge = add(doubleSideEdgeByMiniEdge: $0) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func add<S>(doubleSideEdgesByMiniEdges miniEdges: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListMiniUndirectedEdge<Element, Weight> {
        
        var result = [DoubleSideEdgeTuple]()
        miniEdges.forEach {
            if let edge = add(doubleSideEdgeByMiniEdge: $0) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func remove(doubleSideEdgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>.Tuple) -> DoubleSideEdgeTuple? {
        
        guard let fromTo = remove(
            edgeByFrom: vertexPair.vertex1, to: vertexPair.vertex2
        ) else {
            return nil
        }
        
        guard let toFrom = remove(
            edgeByFrom: vertexPair.vertex2, to: vertexPair.vertex1
        ) else {
            return nil
        }
        
        return (fromTo, toFrom)
    }
    
    @discardableResult
    public mutating func remove(doubleSideEdgeByVertexPair vertexPair: ListUndirectedVertexPair<Element>) -> DoubleSideEdgeTuple? {
        
        guard let fromTo = remove(
            edgeByFrom: vertexPair.uFrom, to: vertexPair.uTo
        ) else {
            return nil
        }
        
        guard let toFrom = remove(
            edgeByFrom: vertexPair.vFrom, to: vertexPair.vTo
        ) else {
            return nil
        }
        
        return (fromTo, toFrom)
    }
    
    @discardableResult
    public mutating func remove<S>(doubleSideEdgesByVertexPairs vertexPairs: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListUndirectedVertexPair<Element>.Tuple {
        
        var result = [DoubleSideEdgeTuple]()
        vertexPairs.forEach {
            if let edge = remove(doubleSideEdgeByVertexPair: $0) {
                result.append(edge)
            }
        }
        return result
    }
    
    @discardableResult
    public mutating func remove<S>(doubleSideEdgesByVertexPairs vertexPairs: S) -> [DoubleSideEdgeTuple] where S: Sequence, S.Element == ListUndirectedVertexPair<Element> {
        
        var result = [DoubleSideEdgeTuple]()
        vertexPairs.forEach {
            if let edge = remove(doubleSideEdgeByVertexPair: $0) {
                result.append(edge)
            }
        }
        return result
    }
    
}

// MARK: ListWeightedDigraphProtocol.Search
extension ListDigraph {
    
    public func breadthFirstSearch(begin beginData: Element) -> [Element] {
        
        var elements = [Element]()
        
        _breadthFirstSearch(begin: beginData) { (element) -> Bool in
            elements.append(element)
            return false
        }
        
        return elements
        
    }
    
    public func depthFirstSearch(begin beginData: Element) -> [Element] {
    
        var elements = [Element]()
        
        _depthFirstSearch(begin: beginData) { (element) -> Bool in
            elements.append(element)
            return false
        }
        
        return elements
        
    }
    
    public func breadthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool) {
        
        _breadthFirstSearch(begin: beginData, dealing: visitor)
    }
    
    public func depthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool) {
        
        _depthFirstSearch(begin: beginData, dealing: visitor)
    }
    
}

extension ListDigraph {
    
    public func _breadthFirstSearch(begin beginData: Element, dealing: (_ element: Element) -> Bool) {
        
        guard let beginVertex = vertices[beginData] else { return }
        
        var visitedVertices: Set<Vertex> = []
        var queue = QueueArray<Vertex>()
        queue.enqueue(beginVertex)
        visitedVertices.insert(beginVertex)

        while let vertex = queue.dequeue() {
            if dealing(vertex.data) { return }

            var iterator = vertexOutEdges[vertex]?.makeIterator()
            while let edge = iterator?.next() {
                guard edge.isEnable else { continue }
                if visitedVertices.contains(edge.to) { continue }
                
                queue.enqueue(edge.to)
                visitedVertices.insert(edge.to)
            }
        }
        
    }
    
    public func _depthFirstSearch(begin beginData: Element, dealing: (_ element: Element) -> Bool) {
        
        guard let beginVertex = vertices[beginData] else { return }

        var visitedVertices: Set<Vertex> = []
        var stack = ArrayStack<Vertex>()
        
        // 先访问起点
        stack.push(beginVertex)
        visitedVertices.insert(beginVertex)
        if dealing(beginData) { return }
        
        while let vertex = stack.pop() {
            
            var iterator = vertexOutEdges[vertex]?.makeIterator()
            while let edge = iterator?.next() {
                guard edge.isEnable else { continue }
                if visitedVertices.contains(edge.to) { continue }
                
                stack.push(edge.from)
                stack.push(edge.to)
                visitedVertices.insert(edge.to)
                if dealing(edge.to.data) { return }
                
                break
            }
        }
        
    }
    
}

// MARK: ListWeightedDigraphProtocol.Components
extension ListDigraph {
    
    public func components() -> UnionFind<Element> {
        
        var uf = UnionFind(sets: vertices.keys)

        edges.forEach {
            guard $0.isEnable else { return }
            
            uf.union($0.from.data, $0.to.data)
        }

        return uf
    }
    
}

// MARK: ListWeightedDigraphProtocol.TopologicalSort
extension ListDigraph {
    
    public func topologicalSort() -> [Element] {
        
        var elements = [Element]()
        var queue = QueueArray<Vertex>()
        var inAngleTable = [Vertex: Int]()
        
        // 初始化（将度为0的节点都放入队列）
        vertices.forEach { (element, vertex) in
            let inCount = vertexInEdges[vertex]?.count ?? 0
            if inCount == 0 {
                queue.enqueue(vertex)
            } else {
                inAngleTable[vertex] = inCount
            }
        }
        
        while let vertex = queue.dequeue() {
            // 放入返回结果中
            elements.append(vertex.data)
            
            var iterator = vertexOutEdges[vertex]?.makeIterator()
            while let edge = iterator?.next() {
                guard !edge.isSelfLoop else { return [] }
                guard edge.isEnable else { continue }
                
                let toInCount = (inAngleTable[edge.to] ?? 0) - 1
                if (toInCount == 0) {
                    queue.enqueue(edge.to)
                } else {
                    inAngleTable[edge.to] = toInCount
                }
            }
        }
        
        return elements
    }
    
}

// MARK: Minimum Spanning Tree
extension ListDigraph {
    
    public func prim() -> Set<ListEdgeInfo<Element, Weight>> {
        
        guard let vertex = vertices.randomElement()?.value else { return [] }
        
        var edgeInfos: Set<ListEdgeInfo<Element, Weight>> = []
        
        var addedVertices: Set<Vertex> = []
        addedVertices.insert(vertex)
        
        guard let edgeSet = vertexOutEdges[vertex] else { return [] }
        
        var heap: BinaryHeap<Edge> = .init(elements: edgeSet) {
            $0.weight < $1.weight
        }
        
        let verticesCount = vertices.count
        while !heap.isEmpty && addedVertices.count < verticesCount {
            guard let edge = heap.remove() else { break }
            guard edge.isEnable else { continue }
            
            if addedVertices.contains(edge.to) { continue }
            
            for info in edge.diedgeInfos { edgeInfos.insert(info) }
            addedVertices.insert(edge.to)
            
            heap.add(elements: vertexOutEdges[edge.to]!)
        }
        
        return edgeInfos
        
    }
    
    public func kruskal() -> Set<ListEdgeInfo<Element, Weight>> {
        
        guard edges.count != 0 else { return [] }
        
        var edgeInfos: Set<ListEdgeInfo<Element, Weight>> = []
        
        var heap: BinaryHeap<Edge> = .init(
            elements: edges.filter { $0.isEnable }
        ) {
            $0.weight < $1.weight
        }
        
        var uf: UnionFind<Vertex> = .init()
        vertices.forEach { uf.makeSet(element: $1) }
        
        let edgeCount = vertices.count - 1
        
        while !heap.isEmpty && edgeInfos.count < edgeCount {
            guard let edge = heap.remove() else { break }
            guard edge.isEnable else { continue }
            
            if uf.isSame(edge.from, edge.to) { continue }
            for info in edge.diedgeInfos { edgeInfos.insert(info) }
            uf.union(element1: edge.from, element2: edge.to)
        }
        return edgeInfos
        
    }
    
}

//MARK: Shortest Path
extension ListDigraph {
    
    public typealias PathInfo = ListPathInfo<Element, Weight>
    
    public func bellmanFordShortestPath(begin: Element) -> [Element: PathInfo] {
        
        guard vertices[begin] != nil else { return [:] }
        
        var selectedPaths: [Element: PathInfo] = [:]
        selectedPaths[begin] = .init()
        
        /// v - 1 次
        for _ in 0 ..< vertices.count - 1 {
            for edge in edges {
                guard edge.isEnable else { continue }
                guard let fromPath = selectedPaths[edge.from.data] else { continue }

                relax(edge: edge, fromPath: fromPath, paths: &selectedPaths)
            }
        }
        
        for edge in edges {
            guard edge.isEnable else { continue }
            guard let fromPath = selectedPaths[edge.from.data] else { continue }

            if relax(edge: edge, fromPath: fromPath, paths: &selectedPaths) {
                #if DEBUG
                print("有负权环")
                #endif
                return [:]
            }
        }
        
        selectedPaths.removeValue(forKey: begin)
        return selectedPaths
    }
    
    /**
     * 松弛
     * @param edge 需要进行松弛的边
     * @param fromPath edge 的 from 的最短路径信息
     * @param paths 存放着其他点（对于 dijkstra 来说，就是还没有离开桌面的点）的最短路径信息
     */
    @discardableResult
    private func relax(edge: Edge, fromPath: PathInfo, paths: inout [Element: PathInfo]) -> Bool {
        
        // 新的可选择的最短路径：beginVertex 到 edge.from 的最短路径 + edge.weight
        let newWeight = fromPath.weight + edge.weight
        
        // 以前的最短路径：beginVertex 到 edge.to 的最短路径
        let oldPath = paths[edge.to.data]
        if oldPath != nil && newWeight >= oldPath!.weight { return false }
        
        if oldPath == nil {
            paths[edge.to.data] = .init()
        } else {
            paths[edge.to.data]?.edgeInfos.removeAll()
        }
        
        paths[edge.to.data]?.weight = newWeight
        paths[edge.to.data]?.edgeInfos.append(contentsOf: fromPath.edgeInfos)
        paths[edge.to.data]?.edgeInfos.append(contentsOf: edge.diedgeInfos)
        
        return true
    }
    
}

extension ListDigraph {
    
    public func dijkstraShortestPath(begin: Element) -> [Element: PathInfo] {
        
        guard let beginVertex = vertices[begin] else { return [:] }
        
        var selectedPaths: [Element: PathInfo] = [:]
        var paths: [Vertex: PathInfo] = [:]
        paths[beginVertex] = .init(weight: .zero)

        while !paths.isEmpty {
            
            let (minVertex, minPath) = self.minPath(in: paths)!
            
            // minVertex 离开桌面
            selectedPaths[minVertex.data] = minPath
            paths.removeValue(forKey: minVertex)
            
            guard let outs = vertexOutEdges[minVertex] else { continue
            }
            
            // 对它的 minVertex 的 outEdges 进行松弛操作
            for edge in outs {
                guard edge.isEnable else { continue }
                // 如果 edge.to 已经离开桌面，就没必要进行松弛操作
                guard selectedPaths[edge.to.data] == nil else { continue }
                relax(edge: edge, fromPath: minPath, paths: &paths)
            }
            
        }
        
        selectedPaths.removeValue(forKey: begin)
        return selectedPaths
        
    }
    
    /**
     * 从 paths 中挑一个最小的路径出来
     * @param paths
     * @return
     */
    private func minPath(in paths: [Vertex: PathInfo]) -> (vertex: Vertex, pathInfo: PathInfo)? {
        
        guard let min = (paths.min { $0.value.weight < $1.value.weight }) else {
            return nil
        }
        
        return (min.key, min.value)
        
    }
    
    /**
     * 松弛
     * @param edge 需要进行松弛的边
     * @param fromPath edge 的 from 的最短路径信息
     * @param paths 存放着其他点（对于 dijkstra 来说，就是还没有离开桌面的点）的最短路径信息
     */
    private func relax(edge: Edge, fromPath: PathInfo, paths: inout [Vertex: PathInfo]) -> Void {
        
        // 新的可选择的最短路径：beginVertex到edge.from的最短路径 + edge.weight
        let newWeight = fromPath.weight + edge.weight
        
        // 以前的最短路径：beginVertex 到 edge.to 的最短路径
        let oldPath = paths[edge.to]
        if oldPath != nil && newWeight >= oldPath!.weight { return }
        
        if oldPath == nil {
            paths[edge.to] = .init()
        } else {
            paths[edge.to]?.edgeInfos.removeAll()
        }

        paths[edge.to]?.weight = newWeight
        paths[edge.to]?.edgeInfos.append(contentsOf: fromPath.edgeInfos)
        paths[edge.to]?.edgeInfos.append(contentsOf: edge.diedgeInfos)
    }

}

extension ListDigraph {
    
    public func floydShortestPath() -> [Element: [Element: PathInfo]] {
        
        var paths: [Element: [Element: PathInfo]] = [:]
        
        // 初始化
        for edge in edges {
            guard edge.isEnable else { continue }
            
            if paths[edge.from.data] == nil { paths[edge.from.data] = [:] }
            
            var pathInfo: PathInfo = .init(weight: edge.weight)
            pathInfo.edgeInfos.append(contentsOf: edge.diedgeInfos)
            paths[edge.from.data]?[edge.to.data] = pathInfo
        }

        vertices.forEach { element2, _ in
            vertices.forEach { element1, _ in
                vertices.forEach { element3, _ in
                    if  element1 == element2 ||
                        element2 == element3 ||
                        element1 == element3 { return }
                    
                    // element1 -> element2
                    guard let path12 = paths[element1]?[element2] else { return }
                    
                    // element2 -> element3
                    guard let path23 = paths[element2]?[element3] else { return }
                    
                    // element1 -> element3
                    let path13 = paths[element1]?[element3]
                    
                    let newWeight = path12.weight + path23.weight
                    if path13 != nil && newWeight >= path13!.weight { return }
                    
                    if path13 == nil {
                        paths[element1]?[element3] = .init()
                    } else {
                        paths[element1]?[element3]?.edgeInfos.removeAll()
                    }
                    
                    paths[element1]?[element3]?.weight = newWeight;
                    paths[element1]?[element3]?.edgeInfos.append(
                        contentsOf: path12.edgeInfos
                    )
                    paths[element1]?[element3]?.edgeInfos.append(
                        contentsOf: path23.edgeInfos
                    )
                }
            }
        }
        
        return paths
        
    }
    
}

extension ListDigraph {
    
    // Method for bidirectional searching
    #if false
    private enum IntersectMode: Int {
        case nothing
        case isIntersected
        case usingBeginPath
        case usingEndPath
    }
    public func bidirectionalSearch(forward: Element, backward: Element) -> PathInfo? {
        
        guard let beginVertex = vertices[forward] else { return nil }
        guard let endVertex = vertices[backward] else { return nil }
        
        var selectedBeginPaths: [Element: PathInfo] = [:]
        var selectedEndPaths: [Element: PathInfo] = [:]
        
        var beginPaths: [Vertex: PathInfo] = [:]
        beginPaths[beginVertex] = .init(weight: .zero)
        
        var endPaths: [Vertex: PathInfo] = [:]
        endPaths[endVertex] = .init(weight: .zero)
        
        var currentBeginEdge: Edge? = nil
        var currentEndEdge: Edge? = nil
        var breakVertexPair: ListDirectedVertexPair<Element>? = nil
        
        var intersectMode: IntersectMode = .nothing

        while !beginPaths.isEmpty && !endPaths.isEmpty {
            
            /// break Point
            if let currentBegin = currentBeginEdge,
               let currentEnd = currentEndEdge {
                
                if currentBegin == currentEnd.reverse() {
                    breakVertexPair = .init(
                        from: currentBegin.from.data, to: currentBegin.to.data
                    )
                    intersectMode = .isIntersected
                    print("break Edge")
                    break
                }
                if currentBegin.to == currentEnd.reverse().to {
                    breakVertexPair = .init(vertex: currentBegin.to.data)
                    intersectMode = .isIntersected
                    print("break Vertex")
                    break
                }
                if currentBegin.to.data == backward {
                    intersectMode = .usingBeginPath
                    break
                }
                if currentEnd.from.data == forward {
                    intersectMode = .usingEndPath
                    break
                }
            }
            
            /// minPath
            let (minBeginVertex, minBeginPath) = self.minPath(in: beginPaths)!
            let (minEndVertex, minEndPath) = self.minPath(in: endPaths)!
            
            currentBeginEdge = minBeginPath.edgeInfos.last != nil
                ? .init(edgeInfo: minBeginPath.edgeInfos.last!)
                : nil
            
            currentEndEdge = minEndPath.edgeInfos.last != nil
                ? .init(edgeInfo: minEndPath.edgeInfos.last!)
                : nil
            
            /// minVertex 离开桌面
            selectedBeginPaths[minBeginVertex.data] = minBeginPath
            beginPaths.removeValue(forKey: minBeginVertex)
            
            selectedEndPaths[minEndVertex.data] = minEndPath
            endPaths.removeValue(forKey: minEndVertex)
            
            guard let beginOuts = vertexOutEdges[minBeginVertex] else {
                continue
            }
            
            /// 对它的 minBeginVertex 的 outEdges 进行松弛操作
            for edge in beginOuts {
                guard edge.isEnable else { continue }
                // 如果 edge.to 已经离开桌面，就没必要进行松弛操作
                guard selectedBeginPaths[edge.to.data] == nil else { continue }
                relax(edge: edge, path: minBeginPath, paths: &beginPaths, isFrom: true)
            }
            
            guard let endIns = vertexInEdges[minEndVertex] else {
                continue
            }
            
            /// 对它的 minEndVertex 的 inEdges 进行松弛操作
            for edge in endIns {
                guard edge.isEnable else { continue }
                // 如果 edge.from 已经离开桌面，就没必要进行松弛操作
                guard selectedEndPaths[edge.from.data] == nil else { continue }
                relax(edge: edge, path: minEndPath, paths: &endPaths, isFrom: false)
            }
            
        }
        print(intersectMode)
        switch intersectMode {
        case .nothing:
            return .init()
        case .isIntersected:
            guard let vertexPair = breakVertexPair else { return nil }
            print(selectedBeginPaths[vertexPair.from])
//            print(selectedEndPaths[vertexPair.to])
            print(selectedEndPaths[vertexPair.from])
            return (
                (selectedBeginPaths[vertexPair.from] ?? .init())
              + (selectedEndPaths[vertexPair.from]?.reverse ?? .init())
            )
        case .usingBeginPath:
            return selectedBeginPaths[backward] ?? .init()
        case .usingEndPath:
            return selectedEndPaths[forward]?.reverse ?? .init()
        }

    }

    private func relax(edge: Edge, path: PathInfo, paths: inout [Vertex: PathInfo], isFrom: Bool) -> Void {
        
        // 新的可选择的最短路径：beginVertex 到 edge.from 的最短路径 + edge.weight
        let newWeight = path.weight + edge.weight
        
        if isFrom {
            // 以前的最短路径：beginVertex 到 edge.to 的最短路径
            let oldPath = paths[edge.to]
            if oldPath != nil && newWeight >= oldPath!.weight { return }
            
            if oldPath == nil {
                paths[edge.to] = .init()
            } else {
                paths[edge.to]?.edgeInfos.removeAll()
            }

            paths[edge.to]?.weight = newWeight
            paths[edge.to]?.edgeInfos.append(contentsOf: path.edgeInfos)
            paths[edge.to]?.edgeInfos.append(contentsOf: edge.diedgeInfos)
        } else {
            // 以前的最短路径：beginVertex 到 edge.from 的最短路径
            let oldPath = paths[edge.from]
            if oldPath != nil && newWeight >= oldPath!.weight { return }
            
            if oldPath == nil {
                paths[edge.from] = .init()
            } else {
                paths[edge.from]?.edgeInfos.removeAll()
            }

            paths[edge.from]?.weight = newWeight
            paths[edge.from]?.edgeInfos.append(contentsOf: path.edgeInfos)
            paths[edge.from]?.edgeInfos.append(contentsOf: edge.diedgeInfos)
        }
    }
    #else
    private struct Bothward<T> {
        var forward: T
        var backward: T

        fileprivate subscript(index: Int) -> T {
            get { index == 0 ? forward : backward }
            set { index == 0 ? (forward = newValue) : (backward = newValue) }
        }
    }
    private struct VertexDist: Hashable, CustomStringConvertible {
        var weight: Weight
        var vertex: Vertex
        
        var description: String {
            "weight: \(weight), vertex: \(vertex)"
        }
    }
    public func bidirectionalShortestPath(begin: Element, end: Element) -> PathInfo? {
 
        guard let beginVertex = vertices[begin] else { return nil }
        guard let endVertex = vertices[end] else { return nil }
        
        guard begin != end else {
            guard let edge = findEdge(byFrom: begin, to: end) else {
                return nil
            }
            return .init(
                weight: edge.weight,
                edgeInfos: [
                    .init(from: begin, to: end, weight: edge.weight)
                ]
            )
        }
        
        /// - Tag: Init, `[Forward, Backward]`
        /// dictionary of final distances
        var dists = Bothward(forward: [Vertex: Weight](), backward: [:])
        /// dictionary of paths
        var paths = Bothward<[Element: [Vertex]]>(
            forward: [begin: [beginVertex]], backward: [end: [endVertex]]
        )
        /// dictionary of weights
        var weights = Bothward<[Element: [Weight]]>(
            forward: [begin: [.zero]], backward: [end: [.zero]]
        )
        /// heap of (distance, node) for choosing node to expand
        func comparator(_ lhs: VertexDist, _ rhs: VertexDist) -> Bool {
            lhs.weight < rhs.weight
        }
        var fringe = Bothward<PriorityQueue<VertexDist>>(
            forward: .init(comparator: comparator),
            backward: .init(comparator: comparator)
        )
        /// dict of distances to seen nodes
        var seen = Bothward<[Vertex: Weight]>(
            forward: [beginVertex: .zero], backward: [endVertex: .zero]
        )
        
        /// - Tag: initialize fringe heap
        fringe.forward.enqueue(.init(weight: .zero, vertex: beginVertex))
        fringe.backward.enqueue(.init(weight: .zero, vertex: endVertex))
        
        /// - Tag: neighs for extracting correct neighbor information
        let neighs = Bothward<InOutEdges>(forward: vertexOutEdges, backward: vertexInEdges)
        
        /// - Tag: variables to hold shortest discovered path
        var finalDist: Weight = .zero
        var finalVertices: [Vertex] = []
        var finalWeights: [Weight] = []
        var dir = 1
        while !fringe.forward.isEmpty && !fringe.backward.isEmpty {
//            print("ps: ", paths)
//            print("fv: ", finalVertices)
//            print("fw: ", finalWeights)
            /// choose direction
            /// dir == 0 is forward direction and dir == 1 is back
            dir = 1 - dir
            /// extract closest to expand
            let closest = fringe[dir].dequeue()!
            if dists[dir][closest.vertex] != nil {
                /// Shortest path to v has already been found
                continue
            }
            /// update distance, equal to seen[dir][v]
            dists[dir][closest.vertex] = closest.weight
            if dists[1 - dir][closest.vertex] != nil {
                /// if we have scanned v in both directions we are done
                /// we have now discovered the shortest path
                var finalPaths: PathInfo.EdgeInfos = []
                var weightIdx = 1
                let count = finalVertices.count
                for idx in 1 ..< count {
                    let from = finalVertices[idx - 1].data
                    let to = finalVertices[idx].data
                    let weight = finalWeights[weightIdx]
                    finalPaths.append(
                        .init(from: from, to: to, weight: weight)
                    )
                    weightIdx += 1
                }
                return .init(weight: finalDist, edgeInfos: finalPaths)
            }
            
            var iter = neighs[dir][closest.vertex]?.makeIterator()
            while let edge = iter?.next() {
                let vwLength = (dists[dir][closest.vertex] ?? .zero) + edge.weight
                let toVertex = (dir == 0 ? edge.to : edge.from)
                if let weight = dists[dir][toVertex] {
                    if vwLength < weight {
                        /// Contradictory paths found: negative weights?
                        return nil
                    }
                } else if seen[dir][toVertex] == nil
                    || vwLength < seen[dir][toVertex]! {
                    /// - Tag: relaxing
                    seen[dir][toVertex] = vwLength
                    fringe[dir].enqueue(
                        .init(weight: vwLength, vertex: toVertex)
                    )
                    paths[dir][toVertex.data] = (
                        (paths[dir][closest.vertex.data] ?? [])
                      + [toVertex]
                    )
                    weights[dir][toVertex.data] = (
                        (weights[dir][closest.vertex.data] ?? [])
                      + [edge.weight]
                    )
                    if let front = seen[0][toVertex], let back = seen[1][toVertex] {
                        /// see if this path is better than the already
                        /// discovered shortest path
                        let totaldist = front + back
                        if finalVertices.isEmpty || finalDist > totaldist {
                            finalDist = totaldist
                            finalVertices = (
                                (paths[0][toVertex.data] ?? [])
                               + Array(
                                    paths[1][toVertex.data]!
                                        .reversed().dropFirst()
                                 )
                            )
                            finalWeights = (
                                (weights[0][toVertex.data] ?? [])
                              + Array(
                                    weights[1][toVertex.data]!
                                        .dropFirst().reversed()
                                )
                            )
                        }
                    }
                }
            }
        }
        
        return nil
    }
    #endif

}

// MARK: - Helper
extension ListDigraph {
    
    private func findEdge(byFrom from: Vertex, to: Vertex) -> Edge? {
        var result: Edge? = nil
        var iter = edges.makeIterator()
        while let edge = iter.next() {
            if edge.from == from && edge.to == to {
                result = edge
                break
            }
        }
        
        return result
    }
    
    private func findEdge(byFrom from: Element, to: Element) -> Edge? {
        guard let fromVertex = vertices[from] else { return nil }
        guard let toVertex = vertices[to] else { return nil }
        
        var result: Edge? = nil
        var iter = edges.makeIterator()
        while let edge = iter.next() {
            if edge.from == fromVertex && edge.to == toVertex {
                result = edge
                break
            }
        }
        
        return result
    }
    
}

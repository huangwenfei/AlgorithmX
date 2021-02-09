//
//  ListGraph.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/2.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct ListGraph<Element: GraphVertexable, Weight: GraphWeightable>: GraphProtocol {
    
    public typealias Element = Element
    public typealias Weight = Weight
    
    fileprivate typealias Vertex = GraphVertex<Element>
    fileprivate typealias Edge = GraphEdge<Element, Weight>
    
    private var vertices: [Element: Vertex] = [:]
    private var edges: Set<Edge> = []
    
    private var vertexInEdges: [Vertex: Set<Edge>] = [:]
    private var vertexOutEdges: [Vertex: Set<Edge>] = [:]
    
    public init() { }
}

//MARK: CustomDebugStringConvertible
extension ListGraph: CustomStringConvertible, CustomDebugStringConvertible {
    
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

//MARK: GraphProtocol.Base
extension ListGraph {
    
    public var verticesCount: Int { vertices.count }
    public var edgesCount: Int { edges.count }
    
    public mutating func add(vertex data: Element) {
        guard vertices[data] == nil else { return }
        vertices[data] = .init(data: data)
    }
    
    public mutating func remove(vertex data: Element) {
        guard let vertex = vertices[data] else { return }
        
        var iterator = vertexOutEdges[vertex]?.makeIterator()
        while let edge = iterator?.next() {
            vertexInEdges[edge.to]?.remove(edge)
            edges.remove(edge)
        }
        vertexOutEdges[vertex] = nil
        
        iterator = vertexInEdges[vertex]?.makeIterator()
        while let edge = iterator?.next() {
            vertexOutEdges[edge.from]?.remove(edge)
            edges.remove(edge)
        }
        vertexInEdges[vertex] = nil
        
        vertices[data] = nil
        
    }
    
    public mutating func addEdge(from fromData: Element, to toData: Element) {
        _addEdge(from: fromData, to: toData)
    }
    
    public mutating func addEdge(from fromData: Element, to toData: Element, weight: Weight) {
        _addEdge(from: fromData, to: toData, weight: weight)
    }
    
    public mutating func removeEdge(from fromData: Element, to toData: Element) {
        guard let fromVertex = vertices[fromData] else { return }
        guard let toVertex = vertices[toData] else { return }
        
        let edge: Edge = .init(from: fromVertex, to: toVertex)
        if (vertexOutEdges[fromVertex]?.remove(edge)) != nil {
            vertexInEdges[toVertex]?.remove(edge)
            edges.remove(edge)
        }
    }
    
}

extension ListGraph {
    
    fileprivate mutating func _addEdge(from fromData: Element, to toData: Element, weight: Weight = .zero) {
        var fromVertex = vertices[fromData]
        if fromVertex == nil {
            fromVertex = .init(data: fromData)
            vertices[fromData] = fromVertex
        }
        
        var toVertex = vertices[toData]
        if toVertex == nil {
            toVertex = .init(data: toData)
            vertices[toData] = toVertex
        }

        let edge: Edge = .init(from: fromVertex!, to: toVertex!, weight: weight)
        if (vertexOutEdges[fromVertex!]?.remove(edge)) != nil {
            vertexInEdges[toVertex!]?.remove(edge)
            edges.remove(edge)
        }
        
        if vertexOutEdges[fromVertex!] == nil {
            vertexOutEdges[fromVertex!] = []
        }
        
        if vertexInEdges[toVertex!] == nil {
            vertexInEdges[toVertex!] = []
        }
        
        vertexOutEdges[fromVertex!]?.insert(edge)
        vertexInEdges[toVertex!]?.insert(edge)
        edges.insert(edge)
        
    }
    
}

// MARK: GraphProtocol.Search
extension ListGraph {
    
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

extension ListGraph {
    
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

// MARK: GraphProtocol.TopologicalSort
extension ListGraph {
    
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

// MARK: - Minimum Spanning Tree
extension ListGraph {
    
    public func prim() -> Set<GraphEdgeInfo<Element, Weight>> {
        
        guard let vertex = vertices.randomElement()?.value else { return [] }
        
        var edgeInfos: Set<GraphEdgeInfo<Element, Weight>> = []
        
        var addedVertices: Set<Vertex> = []
        addedVertices.insert(vertex)
        
        guard let edgeSet = vertexOutEdges[vertex] else { return [] }
        
        var heap: BinaryHeap<Edge> = .init(elements: edgeSet) {
            $0.weight < $1.weight
        }
        
        let verticesCount = vertices.count
        while !heap.isEmpty && addedVertices.count < verticesCount {
            guard let edge = heap.remove() else { break }
            
            if addedVertices.contains(edge.to) { continue }
            
            edgeInfos.insert(edge.info)
            addedVertices.insert(edge.to)
            
            heap.add(elements: vertexOutEdges[edge.to]!)
        }
        
        return edgeInfos
        
    }
    
    public func kruskal() -> Set<GraphEdgeInfo<Element, Weight>> {
        
        guard edges.count != 0 else { return [] }
        
        var edgeInfos: Set<GraphEdgeInfo<Element, Weight>> = []
        
        var heap: BinaryHeap<Edge> = .init(elements: edges) {
            $0.weight < $1.weight
        }
        
        var uf: UnionFind<Vertex> = .init()
        vertices.forEach { uf.makeSet(element: $1) }
        
        let edgeCount = vertices.count - 1
        
        while !heap.isEmpty && edgeInfos.count < edgeCount {
            guard let edge = heap.remove() else { break }
            
            if uf.isSame(edge.from, edge.to) { continue }
            edgeInfos.insert(edge.info)
            uf.union(element1: edge.from, element2: edge.to)
        }
        return edgeInfos;
        
    }
    
}

//MARK: - Shortest Path
extension ListGraph {
    
    public typealias PathInfo = GraphPathInfo<Element, Weight>
    
    public func bellmanFordShortestPath(begin: Element) -> [Element: PathInfo] {
        
        guard vertices[begin] != nil else { return [:] }
        
        var selectedPaths: [Element: PathInfo] = [:]
        selectedPaths[begin] = .init()
        
        /// v - 1 次
        for _ in 0 ..< vertices.count - 1 {
            for edge in edges {
                guard let fromPath = selectedPaths[edge.from.data] else { continue }

                relax(edge: edge, fromPath: fromPath, paths: &selectedPaths)
            }
        }
        
        for edge in edges {
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
            paths[edge.to.data]?.edgeInfos.clear()
        }
        
        paths[edge.to.data]?.weight = newWeight
        paths[edge.to.data]?.edgeInfos.append(elements: fromPath.edgeInfos)
        paths[edge.to.data]?.edgeInfos.append(element: edge.info)
        
        return true
    }
    
}

extension ListGraph {
    
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
    private func minPath(in paths: [GraphVertex<Element>: PathInfo]) -> (vertex: Vertex, pathInfo: PathInfo)? {
        
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
        
        // 以前的最短路径：beginVertex到edge.to的最短路径
        let oldPath = paths[edge.to]
        if oldPath != nil && newWeight >= oldPath!.weight { return }
        
        if oldPath == nil {
            paths[edge.to] = .init()
        } else {
            paths[edge.to]?.edgeInfos.clear()
        }

        paths[edge.to]?.weight = newWeight
        paths[edge.to]?.edgeInfos.append(elements: fromPath.edgeInfos)
        paths[edge.to]?.edgeInfos.append(element: edge.info)
    }

}

extension ListGraph {
    
    public func floydShortestPath() -> [Element: [Element: PathInfo]] {
        
        var paths: [Element: [Element: PathInfo]] = [:]
        
        // 初始化
        for edge in edges {
            if paths[edge.from.data] == nil { paths[edge.from.data] = [:] }
            
            let pathInfo: PathInfo = .init(weight: edge.weight)
            pathInfo.edgeInfos.append(element: edge.info)
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
                        path13?.edgeInfos.clear()
                    }
                    
                    paths[element1]?[element3]?.weight = newWeight;
                    paths[element1]?[element3]?.edgeInfos.append(elements: path12.edgeInfos)
                    paths[element1]?[element3]?.edgeInfos.append(elements: path23.edgeInfos)
                }
            }
        }
        
        return paths
        
    }
    
}

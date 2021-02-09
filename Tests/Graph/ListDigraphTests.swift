//
//  ListDigraphTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/30.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class ListDigraphTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBase() throws {
        /// - Tag: Base
        /// var vertexCount: Int { get }
        /// var edgeCount: Int { get }
        
        /// func add(vertex: Element)
        /// func remove(vertex: Element)
        
        /// func add(edgeByFrom from: Element, to: Element, weight: Weight)
        /// func remove(edgeByFrom: Element, to: Element)
        
        var graph = ListDigraph<String, Int>()
        graph.add(edgeByFrom: "V0", to: "V1", weight: 0)
        graph.add(edgeByFrom: "V1", to: "V0", weight: 0)

        graph.add(edgeByFrom: "V0", to: "V2", weight: 0)
        graph.add(edgeByFrom: "V2", to: "V0", weight: 0)

        graph.add(edgeByFrom: "V0", to: "V3", weight: 0)
        graph.add(edgeByFrom: "V3", to: "V0", weight: 0)

        graph.add(edgeByFrom: "V1", to: "V2", weight: 0)
        graph.add(edgeByFrom: "V2", to: "V1", weight: 0)

        graph.add(edgeByFrom: "V2", to: "V3", weight: 0)
        graph.add(edgeByFrom: "V3", to: "V2", weight: 0)
        
        XCTAssertTrue(graph.vertexCount == 4)
        XCTAssertTrue(graph.edgeCount == 10)

        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.add(edgeByFrom: "V1", to: "V0", weight: 9)
        graph.add(edgeByFrom: "V1", to: "V2", weight: 3)
        graph.add(edgeByFrom: "V2", to: "V0", weight: 2)
        graph.add(edgeByFrom: "V2", to: "V3", weight: 5)
        graph.add(edgeByFrom: "V3", to: "V4", weight: 1)
        graph.add(edgeByFrom: "V0", to: "V4", weight: 6)
        
        XCTAssertTrue(graph.vertexCount == 5)
        XCTAssertTrue(graph.edgeCount == 12)
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.remove(edgeByFrom: "V0", to: "V4")
        
        XCTAssertTrue(graph.vertexCount == 5)
        XCTAssertTrue(graph.edgeCount == 11)
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.remove(vertex: "V0")
        
        XCTAssertTrue(graph.vertexCount == 4)
        XCTAssertTrue(graph.edgeCount == 5)
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
    }
    
    func testBaseReplace() throws {
        
        var graph = ListDigraph<String, Int>()
        graph.add(edgeByFrom: "V0", to: "V1", weight: 0)
        graph.add(edgeByFrom: "V1", to: "V0", weight: 0)

        graph.add(edgeByFrom: "V0", to: "V2", weight: 0)
        graph.add(edgeByFrom: "V2", to: "V0", weight: 0)

        graph.add(edgeByFrom: "V0", to: "V3", weight: 0)
        graph.add(edgeByFrom: "V3", to: "V0", weight: 0)

        graph.add(edgeByFrom: "V1", to: "V2", weight: 0)
        graph.add(edgeByFrom: "V2", to: "V1", weight: 0)

        graph.add(edgeByFrom: "V2", to: "V3", weight: 0)
        graph.add(edgeByFrom: "V3", to: "V2", weight: 0)
        
        XCTAssertTrue(graph.vertexCount == 4)
        XCTAssertTrue(graph.edgeCount == 10)

        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.replace(vertex: "V2", with: "V5")
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.add(edgeByFrom: "V1", to: "V0", weight: 9)
        graph.add(edgeByFrom: "V1", to: "V5", weight: 3)
        graph.add(edgeByFrom: "V5", to: "V0", weight: 2)
        graph.add(edgeByFrom: "V5", to: "V3", weight: 5)
        graph.add(edgeByFrom: "V3", to: "V4", weight: 1)
        graph.add(edgeByFrom: "V0", to: "V4", weight: 6)
        
        XCTAssertTrue(graph.vertexCount == 5)
        XCTAssertTrue(graph.edgeCount == 12)
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.replace(edgeWeightByFrom: "V1", to: "V5", newWeight: 89)
        
        XCTAssertTrue(graph.vertexCount == 5)
        XCTAssertTrue(graph.edgeCount == 12)
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.replace(edgeByVertexPair: ("V3", "V4"), withNewVertexPair: ("V0", "V6"))
        
        XCTAssertTrue(graph.vertexCount == 6)
        XCTAssertTrue(graph.edgeCount == 12)
        
        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.add(selfLoopEdgeInVertex: "V1", withWeight: 11)
        
        XCTAssertTrue(graph.vertexCount == 6)
        XCTAssertTrue(graph.edgeCount == 13)

        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
        ///
        graph.replace(selfLoopEdgeWeightInVertex: "V1", with: 131)
        
        XCTAssertTrue(graph.vertexCount == 6)
        XCTAssertTrue(graph.edgeCount == 13)

        #if true
        print(graph.debugDescription)
        #else
        print(graph.description)
        #endif
        
    }
    
    /**
     * 有向图
     */
    private static func directedGraph(data: Sources.Source) -> ListDigraph<AnyHashable, Double> {
        var graph = ListDigraph<AnyHashable, Double>()
        for edge in data {
            if (edge.count == 1) {
                graph.add(vertex: edge[0])
            } else if (edge.count == 2) {
                graph.add(edgeByFrom: edge[0], to: edge[1], weight: 0)
            } else if (edge.count == 3) {
                let weight = edge[2] as! Double
                graph.add(edgeByFrom: edge[0], to: edge[1], weight: weight)
            }
        }
        return graph
    }
    
    /**
     * 无向图
     * @param data
     * @return
     */
    private static func undirectedGraph(data: Sources.Source) -> ListDigraph<AnyHashable, Double> {
        var graph = ListDigraph<AnyHashable, Double>()
        for edge in data {
            if (edge.count == 1) {
                graph.add(vertex: edge[0])
            } else if (edge.count == 2) {
                graph.add(doubleSideEdgeByMiniEdge: (edge[0], edge[1], 0))
            } else if (edge.count == 3) {
                let weight = edge[2] as! Double
                graph.add(doubleSideEdgeByMiniEdge: (edge[0], edge[1], weight))
            }
        }
        return graph
    }
    
    func testSearch() {
        /// - Tag: Search
        /// func breadthFirstSearch(begin beginData: Element) -> [Element]
        /// func depthFirstSearch(begin beginData: Element) -> [Element]
        
        /// func breadthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool)
        /// func depthFirstSearch(begin beginData: Element, visitor: (_ element: Element) -> Bool)
        
        /// BFS
        let graphB1 = Self.undirectedGraph(data: Sources.bfs01)
        let b1: [Set<AnyHashable>] = [
            ["a"],
            ["b", "f"],
            ["i", "c", "g", "e"],
            ["d", "h"]
        ]
        var b1Print = [AnyHashable]()
        graphB1.breadthFirstSearch(begin: "a") {
//            print($0)
            b1Print.append($0)
            return false
        }
        XCTAssertTrue(b1[0] == .init([b1Print[0]]))
        XCTAssertTrue(b1[1] == .init(b1Print[1 ... 2]))
        XCTAssertTrue(b1[2] == .init(b1Print[3 ... 6]))
        XCTAssertTrue(b1[3] == .init(b1Print[7 ... 8]))
        ///
        let graphB2 = Self.directedGraph(data: Sources.bfs02)
        let b2_begin0: [Set<AnyHashable>] = [
            [0],
            [1, 4],
            [2, 6, 7],
            [5],
            [3]
        ]
        var b2Print_begin0 = [AnyHashable]()
        graphB2.breadthFirstSearch(begin: 0) {
            b2Print_begin0.append($0)
            return false
        }
        XCTAssertTrue(b2_begin0[0] == .init([b2Print_begin0[0]]))
        XCTAssertTrue(b2_begin0[1] == .init(b2Print_begin0[1 ... 2]))
        XCTAssertTrue(b2_begin0[2] == .init(b2Print_begin0[3 ... 5]))
        XCTAssertTrue(b2_begin0[3] == .init([b2Print_begin0[6]]))
        XCTAssertTrue(b2_begin0[4] == .init([b2Print_begin0[7]]))
        ///
        let b2_begin2: [Set<AnyHashable>] = [
            [2],
            [0, 5, 4],
            [1, 3, 7, 6],
        ]
        var b2Print_begin2 = [AnyHashable]()
        graphB2.breadthFirstSearch(begin: 2) {
            b2Print_begin2.append($0)
            return false
        }
        XCTAssertTrue(b2_begin2[0] == .init([b2Print_begin2[0]]))
        XCTAssertTrue(b2_begin2[1] == .init(b2Print_begin2[1 ... 3]))
        XCTAssertTrue(b2_begin2[2] == .init(b2Print_begin2[4 ... 7]))
        ///
        let graphB3 = Self.undirectedGraph(data: Sources.bfs03)
        let b3: [Set<AnyHashable>] = [
            [0],
            [3, 2],
            [1, 7, 4],
            [6],
            [5]
        ]
        var b3Print = [AnyHashable]()
        graphB3.breadthFirstSearch(begin: 0) {
            b3Print.append($0)
            return false
        }
        XCTAssertTrue(b3[0] == .init([b3Print[0]]))
        XCTAssertTrue(b3[1] == .init(b3Print[1 ... 2]))
        XCTAssertTrue(b3[2] == .init(b3Print[3 ... 5]))
        XCTAssertTrue(b3[3] == .init([b3Print[6]]))
        XCTAssertTrue(b3[4] == .init([b3Print[7]]))
        ///
        let graphB4 = Self.directedGraph(data: Sources.bfs04)
        let b4: [Set<AnyHashable>] = [
            [1],
            [3, 5, 2],
            [6, 7, 0]
        ]
        var b4Print = [AnyHashable]()
        graphB4.breadthFirstSearch(begin: 1) {
            b4Print.append($0)
            return false
        }
        XCTAssertTrue(b4[0] == .init([b4Print[0]]))
        XCTAssertTrue(b4[1] == .init(b4Print[1 ... 3]))
        XCTAssertTrue(b4[2] == .init(b4Print[4 ... 6]))
        ///
        /// DFS, 正确
        let graphD1 = Self.undirectedGraph(data: Sources.dfs01)
        graphD1.depthFirstSearch(begin: 0) {
            print($0)
            return false
        }
        print()
        let graphD2 = Self.directedGraph(data: Sources.dfs02)
        graphD2.depthFirstSearch(begin: "a") {
            print($0)
            return false
        }
    }
    
    func testTopological() {
        /// - Tag: Topological Sort
        /// func topologicalSort() -> [Element]
        let graph = Self.directedGraph(data: Sources.topo)
        let result: [AnyHashable] = [3, 1, 0, 2, 5, 7, 6, 4]
        let list = graph.topologicalSort()
        XCTAssertTrue(list == result)
    }
    
    func testMinimumSpanningTree() {
        /// - Tag: Minimum Spanning Tree
        /// func prim() -> Set<GraphEdgeInfo<Element, Weight>>
        /// func kruskal() -> Set<GraphEdgeInfo<Element, Weight>>
        /// 正确~~~
        print("MST1")
        var data = Sources.mst01
        Self.undirectedGraph(data: data).prim().forEach { print($0) }
        ///
        print()
        ///
        Self.undirectedGraph(data: data).kruskal().forEach { print($0) }
        ///
        print("MST2")
        ///
        data = Sources.mst02
        Self.undirectedGraph(data: data).prim().forEach { print($0) }
        ///
        print()
        ///
        Self.undirectedGraph(data: data).kruskal().forEach { print($0) }
    }
    
    func testDijkstraShortestPath() {
        /// - Tag: Shortest Path
        /// func dijkstraShortestPath(begin: Element) -> [Element: GraphPathInfo<Element, Weight>]
        Self.directedGraph(data: Sources.sp)
            .dijkstraShortestPath(begin: "a")
            .forEach {
                print($0.key, " - ", $0.value)
            }
        ///
        print()
        ///
        Self.undirectedGraph(data: Sources.sp)
            .dijkstraShortestPath(begin: "a")
            .forEach {
                print($0.key, " - ", $0.value)
            }
        ///
        print()
        ///
        Self.directedGraph(data: Sources.sp1)
            .dijkstraShortestPath(begin: "a")
            .forEach {
                print($0.key, " - ", $0.value)
            }
        ///
        print()
        ///
        Self.undirectedGraph(data: Sources.sp1)
            .dijkstraShortestPath(begin: "a")
            .forEach {
                print($0.key, " - ", $0.value)
            }
    }
    
    func testBellmanFordShortestPath() {
        /// func bellmanFordShortestPath(begin: Element) -> [Element: GraphPathInfo<Element, Weight>]
        
    }
    
    func testMutilShortestPath() {
        /// func floydShortestPath() -> [Element: [Element: GraphPathInfo<Element, Weight>]]
        ///
        
    }
    
    func testBeginEndShortestPath() {
        /// func bidirectionalSearch(begin: Element, end: Element) -> PathInfo
//        print(
//            Self.directedGraph(data: Sources.bfs02)
//                .bidirectionalSearch(begin: 0, end: 6) ?? "none"
//        )
        ///
        print(
            Self.directedGraph(data: Sources.weight3)
                .bidirectionalShortestPath(begin: "广州", end: "南宁")  ?? "none"
        )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

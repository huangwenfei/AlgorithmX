//
//  GraphEdge.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/2.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct GraphEdge<Element: GraphVertexable, Weight: GraphWeightable> {
    
//    private var diretion: String { "\(from)-\(to)" }
    
    public var from: GraphVertex<Element>
    public var to: GraphVertex<Element>
    public var weight: Weight
    
    public var isSelfLoop: Bool {
        from == to
    }
    
//    public var isUnweighted: Bool {
//        Weight.self == ListUnweighted.self
//    }
    
    public var info: GraphEdgeInfo<Element, Weight> {
        .init(from: from.data, to: to.data, weight: weight)
    }
    
    public init(from: GraphVertex<Element>, to: GraphVertex<Element>, weight: Weight = .zero) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
}

extension GraphEdge: Hashable, Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from &&
        lhs.to == rhs.to
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
//        hasher.combine(diretion)
    }
    
}

extension GraphEdge: CustomStringConvertible, CustomDebugStringConvertible {
  
    public var description: String {
        "[ \(from) -> \(to), weight: \(weight) ]"
    }
    
    public var debugDescription: String {
        "\(from) - \(weight) --> \(to)"
    }
    
}

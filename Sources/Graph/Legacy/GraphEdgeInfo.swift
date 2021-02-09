//
//  GraphEdgeInfo.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/4.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct GraphEdgeInfo<Element: GraphVertexable, Weight: GraphWeightable>: Hashable, CustomStringConvertible {
    
    public var from: Element
    public var to: Element
    public var weight: Weight
    
    public init(from: Element, to: Element, weight: Weight) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    public var description: String {
        "[\(from) --> \(to), weight = \(weight)]"
    }
}

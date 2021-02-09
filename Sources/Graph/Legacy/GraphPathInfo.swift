//
//  GraphPathInfo.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/5.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public class GraphPathInfo<Element: GraphVertexable, Weight: GraphWeightable>: CustomStringConvertible {
    
    public var weight: Weight
    public var edgeInfos: LinkedList<GraphEdgeInfo<Element, Weight>> = .init()
    
    public init() {
        self.weight = .zero
    }
    
    public init(weight: Weight) {
        self.weight = weight
    }

    public var description: String {
        "[weight = \(weight), edgeInfos = \(edgeInfos)]"
    }
    
}

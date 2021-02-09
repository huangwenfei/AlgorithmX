//
//  MatrixDigraph.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/19.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

/** Directed Multigraph
 */

public struct MatrixUnweightedDigraph<Vertex: MatrixGraphVertexable>: MatrixGraphProtocol {
    
    public typealias VertexElement = Vertex
    public typealias Weight = MatrixUnweighted
    
    public init() { }
    
}

public struct MatrixDigraph<Vertex: MatrixGraphVertexable, Weight: MatrixGraphWeightable>: MatrixGraphProtocol {
    
    public typealias VertexElement = Vertex
    public typealias Weight = Weight
    
    public init() { }
    
}

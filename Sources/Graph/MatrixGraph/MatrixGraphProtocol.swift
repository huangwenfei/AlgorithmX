//
//  MatrixGraphProtocol.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/19.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public protocol MatrixGraphProtocol {
    
    associatedtype VertexElement: MatrixGraphVertexable
    associatedtype Weight: MatrixGraphWeightable
    
}

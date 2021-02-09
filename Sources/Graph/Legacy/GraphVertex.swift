//
//  GraphVertex.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/2.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct GraphVertex<Element: GraphVertexable> {
    
    public var index: Int
    public var data: Element
    
    public init(data: Element) {
        self.index = -1
        self.data = data
    }
    
    public init(index: Int, data: Element) {
        self.index = index
        self.data = data
    }
    
}

extension GraphVertex: Hashable { }
extension GraphVertex: Equatable { }

extension GraphVertex: CustomStringConvertible, CustomDebugStringConvertible {
  
    public var description: String {
        debugDescription
    }
    
    public var debugDescription: String {
        index == -1 ? "\(data)" : "\(index): \(data)"
    }
    
}

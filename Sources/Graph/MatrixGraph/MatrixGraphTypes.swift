//
//  MatrixGraphTypes.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/19.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

// MARK: Vertex
public typealias MatrixGraphVertexable = Hashable

// MARK: Weight
public typealias MatrixGraphWeightable = Hashable

// MARK: MatrixUnweighted
public struct MatrixUnweighted: MatrixGraphWeightable, CustomStringConvertible {

    internal private(set) var value: Int
    public init() { value = 1  }
    private init(value: Int) { self.value = value }
    
//    /// - Tag: AdditiveArithmetic
//    public static var zero: MatrixUnweighted = .init(value: 0)
//
//    public static func + (lhs: MatrixUnweighted, rhs: MatrixUnweighted) -> MatrixUnweighted {
//        .init(value: lhs.value + rhs.value)
//    }
//
//    public static func - (lhs: MatrixUnweighted, rhs: MatrixUnweighted) -> MatrixUnweighted {
//        .init(value: lhs.value - rhs.value)
//    }
    
    /// - Tag: Equalable
    public static func == (lhs: MatrixUnweighted, rhs: MatrixUnweighted) -> Bool {
        lhs.value == rhs.value
    }
    
    /// - Tag: Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
//    /// - Tag: Comparable
//    public static func < (lhs: MatrixUnweighted, rhs: MatrixUnweighted) -> Bool {
//        lhs.value < rhs.value
//    }

    /// - Tag: CustomStringConvertible
    public var description: String { "\(value.description)" }
    
}

//
//  ComparatorResult.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

import Foundation

public enum ComparatorResult: Int {
    /// `$0 < $1`
    case less = -1
    /// `$0 == $1`
    case equal = 0
    /// `$0 > $1`
    case grater = 1
    
    public init<N: Numeric & Comparable>(_ lhs: N, _ rhs: N) {
        if lhs < rhs {
            self = .less
        } else if lhs > rhs {
            self = .grater
        } else {
            self = .equal
        }
    }
    
}


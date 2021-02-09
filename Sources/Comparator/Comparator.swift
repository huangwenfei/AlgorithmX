//
//  Comparator.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

import Foundation

public protocol Comparator {
    associatedtype Element
    typealias Comparator = (Element, Element) -> ComparatorResult
}

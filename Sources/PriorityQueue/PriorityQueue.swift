//
//  PriorityQueue.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

import Foundation

public struct PriorityQueue<Element: Equatable>: PriorityQueueProtocol {

    public typealias Comparator = BinaryHeap<Element>.Comparator
    
    private var heap: BinaryHeap<Element>
    
    public var elements: [Element] { heap.elements }
    
    public var count: Int { heap.count }
    public var isEmpty: Bool { heap.isEmpty }
    
    public init(elements: [Element] = [], comparator: @escaping Comparator) {
        heap = .init(elements: elements, comparator: comparator)
    }
    
    public mutating func clear() {
        heap.clear()
    }
    
    public mutating func enqueue(_ element: Element) {
        heap.add(element: element)
    }
    
    public var peek: Element? {
        heap.peek
    }
    
    public mutating func dequeue() -> Element? {
        heap.remove()
    }
    
    public mutating func repriority(byNewComparator new: @escaping Comparator) {
        heap.reheap(byNewComparator: new)
    }
    
}

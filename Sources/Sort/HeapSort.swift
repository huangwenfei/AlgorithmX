//
//  HeapSort.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/2.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct HeapSort<Element: Equatable> {
    
    private var heap: BinaryHeap<Element>
    
    public init(elements: [Element] = [], comparator: @escaping (_ lhs: Element, _ rhs: Element) -> Bool) {
        heap = BinaryHeap(elements: elements, comparator: comparator)
    }
    
    public mutating func add(element: Element) {
        heap.add(element: element)
        sorted()
    }
    
    public mutating func remove() -> Element? {
        guard heap.isEmpty else { return nil }
        defer { sorted() }
        return heap.remove()
    }
    
    @discardableResult
    public mutating func sorted() -> [Element] {
        
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
    
        return heap.elements
    }
    
}

extension BinaryHeap {
    
    mutating func siftDown(from index: Int, upTo size: Int) {
        var parent = index
        while true {
            
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < size && comparator(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < size && comparator(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
                
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
}

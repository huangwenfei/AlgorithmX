//
//  BinaryHeap.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

import Foundation

public struct BinaryHeap<Element: Equatable>: HeapProtocol {
    
    public typealias Element = Element
    public typealias Comparator = Self.Comparator
    
    internal var elements: [Element]
    internal var comparator: Comparator
    
    public var count: Int { elements.count }
    public var isEmpty: Bool { elements.isEmpty }
    
    public init(comparator: @escaping Comparator) {
        self.elements = []
        self.comparator = comparator

        heapify()
    }

    public init<S>(elements: S, comparator: @escaping Comparator) where S: Sequence, S.Element == Element {
        self.elements = .init(elements)
        self.comparator = comparator

        heapify()
    }
    
    public mutating func clear() {
        elements = []
    }
    
    public mutating func add(element: Element) {
        elements.append(element)
        siftUp(index: elements.count - 1)
    }
    
    public mutating func add<S>(elements: S) where S: Sequence, S.Element == Element {
        for element in elements { add(element: element) }
    }
    
    public var peek: Element? {
        elements.first
    }
    
    @discardableResult
    public mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        defer {
            siftDown(index: 0)
        }
        return elements.removeLast()
    }
    
    @discardableResult
    public mutating func replace(element: Element) -> Element? {
        guard !isEmpty else {
            elements.append(element)
            return nil
        }
        
        let top = elements[0]
        elements[0] = element
        siftDown(index: 0)
        
        return top
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else { return nil }
        
        if index == elements.count - 1 {
            return elements.removeLast() // 2
        } else {
            elements.swapAt(index, elements.count - 1) // 3
            defer {
                siftDown(index: index) // 5
                siftUp(index: index)
            }
            return elements.removeLast() // 4
        }
    }
    
    public func index(of element: Element, startingAt i: Int) -> Int? {
      if i >= count { return nil }
        
      if comparator(element, elements[i]) {
        return nil
      }
      if element == elements[i] {
        return i
      }
      if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
        return j
      }
      if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
        return j
      }
      return nil
    }
    
    public mutating func reheap(byNewComparator new: @escaping Comparator) {
        self.comparator = new
        heapify()
    }
    
}

extension BinaryHeap {
    
    internal func leftChildIndex(ofParentAt index: Int) -> Int {
        (index << 1) + 1
    }
    
    internal func rightChildIndex(ofParentAt index: Int) -> Int {
        (index << 1) + 2
    }
    
    internal func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) >> 1
    }
    
}

extension BinaryHeap {
    
    /**
     * 批量建堆
     */
    private mutating func heapify() {
        // 自上而下的上滤
//        for idx in 1 ..< count {
//            siftUp(index: idx)
//        }
        
        // 自下而上的下滤
        for idx in stride(from: (count >> 1) - 1, through: 0, by: -1) {
            siftDown(index: idx)
        }
    }
    
    /**
     * 让index位置的元素下滤
     * @param index
     */
    internal mutating func siftDown(index: Int) {
        
        var parent = index
        while true {
            
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < count && comparator(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && comparator(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
        
    }
    
    /**
     * 让index位置的元素上滤
     * @param index
     */
    private mutating func siftUp(index: Int) {
        
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && comparator(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
        
    }
    
}

/// CustomStringConvertible
extension BinaryHeap {
    
    public var description: String {
        elements.description
    }
    
}

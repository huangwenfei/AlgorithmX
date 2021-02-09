//
//  QueueRingBuffer.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public struct QueueRingBuffer<Element>: QueueProtocol {
    
    public typealias Element = Element
    
    private var ringBuffer: RingBuffer
    
    public static var defaultCount: Int { 10 }
    public init() {
        self.init(count: Self.defaultCount)
    }
    
    public init(count: Int) {
        ringBuffer = .init(count: count)
    }
    
    public init(_ elements: [Element]) {
        self.init(count: elements.count)
        enqueue(elements: elements)
    }
    
    public var capacity: Int { ringBuffer.elements.count }
    
    public var count: Int { ringBuffer.availableSpaceForReading }
    
    public var isEmpty: Bool { count == 0 }
    
    public mutating func clear() {
        ringBuffer.clear()
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        ringBuffer.write(element)
    }
    
    @discardableResult
    public mutating func enqueue(elements: [Element]) -> Bool {
        for element in elements {
            guard ringBuffer.write(element) else { return false }
        }
        return true
    }
    
    public var peek: Element? {
        ringBuffer.first
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        ringBuffer.read()
    }
    
}

// MARK: - ExpressibleByArrayLiteral
extension QueueRingBuffer {
    
    public init(count: Int, elements: Element...) {
        self.init(count: count)
        let elementsCount = elements.count
        enqueue(elements:
            elementsCount > count ? .init(elements[0 ..< count])
                                  : elements
        )
    }
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
}

// MARK: - CustomStringConvertible
extension QueueRingBuffer: CustomStringConvertible {
    
    public var description: String {
        .init(describing: ringBuffer)
    }
    
}

// MARK: - Sequence
extension QueueRingBuffer {
    
    public struct Iterator: IteratorProtocol {
        
        private var elements: [Element]
        private var current: Int = 0
        
        fileprivate init(elements: [Element]) {
            self.elements = elements
        }
        
        public mutating func next() -> Element? {
            let next: Element? = (current == elements.count) ? nil : elements[current]
            current += 1
            return next
        }
    }
    
    public func makeIterator() -> Iterator {
        ringBuffer.makeIterator()
    }
    
}

// MARK: - RingBuffer
extension QueueRingBuffer {
    
    public struct RingBuffer {
      
        fileprivate var elements: [Element?]
        private var readIndex = 0
        private var writeIndex = 0

        public init(count: Int) {
            elements = .init(repeating: nil, count: count)
        }
        
        public mutating func clear() {
            elements = .init(repeating: nil, count: elements.count)
            readIndex = 0
            writeIndex = 0
        }

        public var first: Element? {
            elements[readIndex]
        }

        public mutating func write(_ element: Element) -> Bool {
            if !isFull {
                elements[writeIndex % elements.count] = element
                writeIndex += 1
                return true
            } else {
                return false
            }
        }

        public mutating func read() -> Element? {
            if !isEmpty {
                let element = elements[readIndex % elements.count]
                readIndex += 1
                return element
            } else {
                return nil
            }
        }

        internal var availableSpaceForReading: Int {
            writeIndex - readIndex
        }

        public var isEmpty: Bool {
            availableSpaceForReading == 0
        }

        internal var availableSpaceForWriting: Int {
            elements.count - availableSpaceForReading
        }

        public var isFull: Bool {
            availableSpaceForWriting == 0
        }

    }
    
}

// MARK: - QueueRingBuffer.RingBuffer.CustomStringConvertible
extension QueueRingBuffer.RingBuffer: CustomStringConvertible {
    
    private func read(_ index: inout Int) -> Element? {
        if !isEmpty {
            let element = elements[index % elements.count]
            index += 1
            return element
        } else {
            return nil
        }
    }
    
    public var description: String {
        var readIndex = self.readIndex
        var elements = [String]()
        for _ in 0 ..< availableSpaceForReading {
            guard let element = read(&readIndex) else { continue }
            elements.append("\(element)")
        }
        return "[" + elements.joined(separator: ", ") + "]"
    }
    
}

// MARK: - - QueueRingBuffer.RingBuffer.Sequence
extension QueueRingBuffer.RingBuffer: Sequence {
    
    public func makeIterator() -> QueueRingBuffer.Iterator {
        guard !isEmpty else { return .init(elements: []) }
        let splitPoint = readIndex
        let readRightElements = elements[splitPoint ..< elements.count - 1]
        let readLeftElements = elements[0 ..< splitPoint]
        return .init(
            elements: (readRightElements + readLeftElements).compactMap { $0 }
        )
    }
    
}

//
//  ListGraphTypes.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/19.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

// MARK: Vertex
public typealias ListGraphVertexable = Hashable

// MARK: Weight
public typealias ListGraphWeightable = AdditiveArithmetic & Hashable & Comparable

// MARK: ListUnweighted
public struct ListUnweighted: ListGraphWeightable, CustomStringConvertible {

    private var mark: String = "\(Self.self).uw.uw.AlgorithmX.uw"
    
    internal private(set) var value: Int
    public init() { value = 1  }
    private init(value: Int) { self.value = value }
    
    /// - Tag: AdditiveArithmetic
    public static var zero: ListUnweighted = .init(value: 0)
    
    public static func + (lhs: ListUnweighted, rhs: ListUnweighted) -> ListUnweighted {
        .init(value: lhs.value + rhs.value)
    }
    
    public static func - (lhs: ListUnweighted, rhs: ListUnweighted) -> ListUnweighted {
        .init(value: lhs.value - rhs.value)
    }
    
    /// - Tag: Equalable
    public static func == (lhs: ListUnweighted, rhs: ListUnweighted) -> Bool {
        lhs.value == rhs.value &&
        lhs.mark == rhs.mark
    }
    
    /// - Tag: Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(mark)
    }
    
    /// - Tag: Comparable
    public static func < (lhs: ListUnweighted, rhs: ListUnweighted) -> Bool {
        lhs.value < rhs.value
    }
    
    /// - Tag: CustomStringConvertible
    public var description: String { "\(value.description)" }
    
}

// MARK: Vertex
public struct ListVertex<Element: ListGraphVertexable> {
    
    /// - Tag: Value
    public var data: Element
    
    public init(data: Element) {
        self.data = data
    }
    
}

extension ListVertex: Hashable { }
extension ListVertex: Equatable { }

extension ListVertex: CustomStringConvertible, CustomDebugStringConvertible {
  
    public var description: String {
        debugDescription
    }
    
    public var debugDescription: String {
        "\(data)"
    }
    
}

// MARK: VertexPair
public struct ListUndirectedVertexPair<Element: ListGraphVertexable>: Hashable {
    
    public typealias Tuple = (vertex1: Element, vertex2: Element)
    
    public private(set) var uFrom: Element
    public private(set) var uTo: Element
    public var vFrom: Element { uTo }
    public var vTo: Element { uFrom }
    
    public init(vertex: Element) {
        self.uFrom = vertex
        self.uTo = vertex
    }
    
    public init(vertex1: Element, vertex2: Element) {
        self.uFrom = vertex1
        self.uTo = vertex2
    }
    
}

public struct ListDirectedVertexPair<Element: ListGraphVertexable>: Hashable {
    
    public typealias Tuple = (from: Element, to: Element)
    
    public private(set) var from: Element
    public private(set) var to: Element
    
    public init(vertex: Element) {
        self.from = vertex
        self.to = vertex
    }
    
    public init(from: Element, to: Element) {
        self.from = from
        self.to = to
    }
    
}

// MARK: WeightPair
public struct ListWeightPair<Element: ListGraphWeightable>: Hashable {
    
    public private(set) var fromTo: Element
    public private(set) var toFrom: Element
    
    public init(weight: Element) {
        self.fromTo = weight
        self.toFrom = weight
    }
    
    public init(fromTo: Element, toFrom: Element) {
        self.fromTo = fromTo
        self.toFrom = toFrom
    }
    
}

// MARK: MiniEdge
public struct ListMiniUndirectedEdge<Element: ListGraphVertexable, Weight: ListGraphWeightable>: Hashable {
    
    public typealias Tuple = (vertex1: Element, vertex2: Element, weight: Weight)
    
    public private(set) var uFrom: Element
    public private(set) var uTo: Element
    
    public var vFrom: Element { uTo }
    public var vTo: Element { uFrom }
    
    public private(set) var weight: Weight
    
    public init(vertex1: Element, vertex2: Element, weight: Weight) {
        self.uFrom = vertex1
        self.uTo = vertex2
        self.weight = weight
    }
    
}

public struct ListMiniDirectedEdge<Element: ListGraphVertexable, Weight: ListGraphWeightable>: Hashable {
    
    public typealias Tuple = (from: Element, to: Element, weight: Weight)
    
    public private(set) var from: Element
    public private(set) var to: Element
    public private(set) var weight: Weight
    
    public init(from: Element, to: Element, weight: Weight) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
}

// MARK: Edge
public protocol ListEdgeProtocol: Hashable {
    associatedtype VertexElement: ListGraphVertexable
    associatedtype Weight: ListGraphWeightable
    
    var isEnables: [Weight: Bool] { get set }
    
    var isSelfLoop: Bool { get }
    var isDirected: Bool { get }
    var isMutil: Bool { get }
    
    var diedgeInfos: [ListEdgeInfo<VertexElement, Weight>] { get }
    var diedges: [ListDirectedEdge<VertexElement, Weight>] { get }
    
    var reverse: Self { get }
}

extension ListEdgeProtocol {
    
    public var isUnweighted: Bool {
        Self.isUnweighted
    }
    
    public static var isUnweighted: Bool {
        Weight.self == ListUnweighted.self
    }
    
    public var isUndirected: Bool {
        !isDirected
    }
    
}

public protocol ListSingleEdgeProtocol: ListEdgeProtocol {
    
    var isEnable: Bool { get }
    
    var isDisable: Bool { get }
    
}

public protocol ListMutilEdgeProtocol: ListEdgeProtocol {
    
    /// Enable, Valid only `if isUnweighted`.
    func isEnable() -> Bool
    func isDisable() -> Bool
    
    mutating func enable()
    mutating func disable()
    
    /// Enable, Valid only `if not isUnweighted`.
    func isEnable(with weight: Weight) -> Bool
    func isDisable(with weight: Weight) -> Bool
    
    mutating func enable(by weight: Weight)
    mutating func disable(by weight: Weight)
    
    /// Valid only `if isUnweighted`.
    mutating func append()
    mutating func remove()
    
    /// Valid only `if not isUnweighted`.
    mutating func append(_ weight: Weight)
    mutating func remove(by weight: Weight)
    
}

/// - Tag: AnyListEdge
public struct AnyListEdge: Hashable {

    /// The value wrapped by this instance.
    private var _base: AnyHashable
    
    public var base: Any { _base.base }

    /// Creates a type-erased ListEdgeProtocol value that wraps the given instance.
    ///
    /// - Parameter base: A ListEdgeProtocol value to wrap.
    public init<H>(_ base: H) where H : ListEdgeProtocol {
        self._base = base
    }

}

/// - Tag: ListMutilUndirectedEdge
/**
  Self-Loop:
  +-- w -+-+-+
  |      | | | ...
  |      ↓ ↓ ↓
  |    +-------+
  |    |       |
  +--->|   u   |
  +--->|       |
  +--->|       |
   ... |       |
       +-------+
 
 Or
 
  U <==> V:
  +-------+           +-------+
  |       |  <= w =>  |       |
  |   u   |  <= w =>  |   v   |
  |       |  <= w =>  |       |
  |       |    ...    |       |
  +-------+           +-------+
 */
public struct ListMutilUndirectedEdge<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListMutilEdgeProtocol {
    
    public typealias VertexElement = Element
    public typealias Weight = Weight
    
    /// - Tag: Enable
    public var isEnables: [Weight: Bool] = [:]
    
    /// - Tag: Properties
    public var uFrom: ListVertex<Element>
    public var uTo: ListVertex<Element>
    
    public var vFrom: ListVertex<Element> {
        get { uTo }
        set { uTo = newValue }
    }
    
    public var vTo: ListVertex<Element> {
        get { uFrom }
        set { uFrom = newValue }
    }
    
    public private(set) var weights: Set<Weight> = []
    
    /// Important: If `Weight == ListUnweighted`, then `weights.count == 1/0`, where count records how many parallel edges there are. Instead, `weights.count == count`.
    public private(set) var count: Int = 0 {
        didSet { if count < 0 { count = 0 } }
    }
    
    /// - Tag: Self-Loops
    public var isSelfLoop: Bool {
        uFrom == uTo
    }
    
    /// - Tag: Directed
    public var isDirected: Bool {
        false
    }
    
    /// - Tag: Mutil
    public var isMutil: Bool {
        true
    }
    
    /// - Tag: Directed Edges
    public var diedgeInfos: [ListEdgeInfo<Element, Weight>] {
        guard count != 0 else { return [] }
        if isUnweighted {
            
            guard let weight = weights.randomElement() else { return [] }
            
            var result: [ListEdgeInfo<Element, Weight>] = []
            for _ in 0 ..< count * 2 {
                let udiEdge: ListUndirectedEdge<Element, Weight> = .init(
                    vertex1: uFrom, vertex2: uTo, weight: weight
                )
                result.append(contentsOf: udiEdge.diedgeInfos)
            }
            return result
            
        } else {
            
            return .init(
                unsafeUninitializedCapacity: count * 2) { (buffer, count) in
                    count = self.count * 2
                    var iter = weights.makeIterator()
                    var idx = 0
                    while let weight = iter.next() {
                        buffer[idx] = .init(
                            from: uFrom.data, to: uTo.data, weight: weight
                        )
                        buffer[idx + 1] = .init(
                            from: vFrom.data, to: vTo.data, weight: weight
                        )
                        idx += 2
                    }
                    
                }
        }
    }
    
    public var diedges: [ListDirectedEdge<Element, Weight>] {
        guard count != 0 else { return [] }
        if isUnweighted {
            
            guard let weight = weights.randomElement() else { return [] }
            
            var result: [ListDirectedEdge<Element, Weight>] = []
            for _ in 0 ..< count * 2 {
                let udiEdge: ListUndirectedEdge<Element, Weight> = .init(
                    vertex1: uFrom, vertex2: uTo, weight: weight
                )
                result.append(contentsOf: udiEdge.diedges)
            }
            return result
            
        } else {
            
            return .init(
                unsafeUninitializedCapacity: count * 2) { (buffer, count) in
                    count = self.count * 2
                    var iter = weights.makeIterator()
                    var idx = 0
                    while let weight = iter.next() {
                        buffer[idx] = .init(
                            from: uFrom, to: uTo, weight: weight
                        )
                        buffer[idx + 1] = .init(
                            from: vFrom, to: vTo, weight: weight
                        )
                        idx += 2
                    }
                    
                }
        }
    }
    
    /// - Tag: Init
    private init(vertex1: ListVertex<Element>, vertex2: ListVertex<Element>) {
        uFrom = vertex1
        uTo = vertex2
    }
    
    public init(vertex: ListVertex<Element>, weight: Weight) {
        uFrom = vertex
        uTo = vertex
        weights.insert(weight)
        count = 1
    }
    
    public init(vertex1: ListVertex<Element>, vertex2: ListVertex<Element>, weight: Weight) {
        uFrom = vertex1
        uTo = vertex2
        weights.insert(weight)
        count = 1
    }
    
    internal init(edgeInfo: ListEdgeInfo<Element, Weight>) {
        self.uFrom = .init(data: edgeInfo.from)
        self.uTo = .init(data: edgeInfo.to)
        self.weights.insert(edgeInfo.weight)
        self.count = 1
    }
    
}

extension ListMutilUndirectedEdge {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.uFrom == rhs.uFrom &&
        lhs.uTo == rhs.uTo &&
        lhs.weights == rhs.weights &&
        lhs.count == rhs.count &&
        lhs.isDirected == rhs.isDirected &&
        lhs.isMutil == rhs.isMutil
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uFrom)
        hasher.combine(uTo)
        hasher.combine(weights)
        hasher.combine(count)
        hasher.combine(isDirected)
        hasher.combine(isMutil)
    }
    
}

extension ListMutilUndirectedEdge {
    
    public var reverse: Self {
        var result = Self(vertex1: uTo, vertex2: uFrom)
        result.weights = self.weights
        result.count = self.count
        return result
    }
    
}

/// - Tag: ListMutilEdgeProtocol
extension ListMutilUndirectedEdge {
    
    /// Enable, Valid only `if isUnweighted`.
    public func isEnable() -> Bool {
        guard isUnweighted else { return false }
        return count > 0
    }
    
    public func isDisable() -> Bool {
        guard isUnweighted else { return true }
        return count == 0
    }
    
    public mutating func enable() {
        append()
    }
    
    public mutating func disable() {
        remove()
    }
    
    /// Enable, Valid only if Weight != listUnweighted.
    public func isEnable(with weight: Weight) -> Bool {
        guard !isUnweighted else { return false }
        guard weights.contains(weight) else { return false }
        return isEnables[weight]!
    }
    
    public func isDisable(with weight: Weight) -> Bool {
        guard !isUnweighted else { return true }
        guard weights.contains(weight) else { return true }
        return !isEnables[weight]!
    }
    
    public mutating func enable(by weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.contains(weight) else { return }
        isEnables[weight] = true
    }
    
    public mutating func disable(by weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.contains(weight) else { return }
        isEnables[weight] = false
    }
    
    /// Valid only if Weight == listUnweighted.
    public mutating func append() {
        guard isUnweighted else { return }
        count += 1
    }
    
    public mutating func remove() {
        guard isUnweighted else { return }
        count -= 1
        if count == 0 { weights = [] }
    }
    
    /// Valid only if Weight != listUnweighted.
    public mutating func append(_ weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.isEmpty else { return }
        weights.insert(weight)
        count = weights.count
        isEnables[weight] = true
    }
    
    public mutating func remove(by weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.isEmpty else { return }
        weights.remove(weight)
        count = weights.count
        isEnables[weight] = nil
    }
    
}

/// - Tag: ListMutilDirectedEdge
/**
  Self-Loop:
  +-- w -+-+-+
  |      | | | ...
  |      ↓ ↓ ↓
  +----[   u   ]

 Or

  U -> V:
  +-------+           +-------+
  |       |  -- w ->  |       |
  |   u   |  -- w ->  |   v   |
  |       |  -- w ->  |       |
  |       |    ...    |       |
  +-------+           +-------+

 Or

  V -> U:
 +-------+           +-------+
 |       |  -- w ->  |       |
 |   v   |  -- w ->  |   u   |
 |       |  -- w ->  |       |
 |       |    ...    |       |
 +-------+           +-------+
 */
public struct ListMutilDirectedEdge<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListMutilEdgeProtocol {
    
    public typealias VertexElement = Element
    public typealias Weight = Weight
    
    /// - Tag: Enable
    public var isEnables: [Weight: Bool] = [:]
    
    /// - Tag: Properties
    public var from: ListVertex<Element>
    public var to: ListVertex<Element>
    
    public private(set) var weights: Set<Weight> = []
    
    /// Important: If `Weight == ListUnweighted`, then `weights.count == 1/0`, where count records how many parallel edges there are. Instead, `weights.count == count`.
    public private(set) var count: Int = 0 {
        didSet { if count < 0 { count = 0 } }
    }
    
    /// - Tag: Self-Loops
    public var isSelfLoop: Bool {
        from == to
    }
    
    /// - Tag: Directed
    public var isDirected: Bool {
        true
    }
    
    /// - Tag: Mutil
    public var isMutil: Bool {
        true
    }
    
    /// - Tag: Directed Edges
    public var diedgeInfos: [ListEdgeInfo<Element, Weight>] {
        guard count != 0 else { return [] }
        if isUnweighted {
            guard let weight = weights.randomElement() else { return [] }
            return .init(
                repeating: .init(
                    from: from.data, to: to.data, weight: weight
                ),
                count: count
            )
        } else {
            return .init(
                unsafeUninitializedCapacity: count) { (buffer, count) in
                    count = self.count
                    var iter = weights.makeIterator()
                    var idx = 0
                    while let weight = iter.next() {
                        buffer[idx] = .init(
                            from: from.data, to: to.data, weight: weight
                        )
                        idx += 1
                    }
                }
        }
    }
    
    public var diedges: [ListDirectedEdge<Element, Weight>] {
        guard count != 0 else { return [] }
        if isUnweighted {
            guard let weight = weights.randomElement() else { return [] }
            return .init(
                repeating: .init(from: from, to: to, weight: weight),
                count: count
            )
        } else {
            return .init(
                unsafeUninitializedCapacity: count) { (buffer, count) in
                    count = self.count
                    var iter = weights.makeIterator()
                    var idx = 0
                    while let weight = iter.next() {
                        buffer[idx] = .init(from: from, to: to, weight: weight)
                        idx += 1
                    }
                }
        }
    }
    
    /// - Tag: Init
    private init(from: ListVertex<Element>, to: ListVertex<Element>) {
        self.from = from
        self.to = to
    }
    
    public init(vertex: ListVertex<Element>, weight: Weight) {
        self.from = vertex
        self.to = vertex
        self.weights.insert(weight)
        self.count = 1
    }
    
    public init(from: ListVertex<Element>, to: ListVertex<Element>, weight: Weight) {
        self.from = from
        self.to = to
        self.weights.insert(weight)
        self.count = 1
    }
    
    internal init(edgeInfo: ListEdgeInfo<Element, Weight>) {
        self.from = .init(data: edgeInfo.from)
        self.to = .init(data: edgeInfo.to)
        self.weights.insert(edgeInfo.weight)
        self.count = 1
    }
    
}

extension ListMutilDirectedEdge {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from &&
        lhs.to == rhs.to &&
        lhs.weights == rhs.weights &&
        lhs.count == rhs.count &&
        lhs.isDirected == rhs.isDirected &&
        lhs.isMutil == rhs.isMutil
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
        hasher.combine(weights)
        hasher.combine(count)
        hasher.combine(isDirected)
        hasher.combine(isMutil)
    }
    
}

extension ListMutilDirectedEdge {
    
    public var reverse: Self {
        var result = Self(from: to, to: from)
        result.weights = self.weights
        result.count = self.count
        return result
    }
    
}

/// - Tag: ListMutilEdgeProtocol
extension ListMutilDirectedEdge {
    
    /// Enable, Valid only `if isUnweighted`.
    public func isEnable() -> Bool {
        guard isUnweighted else { return false }
        return count > 0
    }
    
    public func isDisable() -> Bool {
        guard isUnweighted else { return true }
        return count == 0
    }
    
    public mutating func enable() {
        append()
    }
    
    public mutating func disable() {
        remove()
    }
    
    /// Enable, Valid only if Weight != listUnweighted.
    public func isEnable(with weight: Weight) -> Bool {
        guard !isUnweighted else { return false }
        guard weights.contains(weight) else { return false }
        return isEnables[weight]!
    }
    
    public func isDisable(with weight: Weight) -> Bool {
        guard !isUnweighted else { return true }
        guard weights.contains(weight) else { return true }
        return !isEnables[weight]!
    }
    
    public mutating func enable(by weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.contains(weight) else { return }
        isEnables[weight] = true
    }
    
    public mutating func disable(by weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.contains(weight) else { return }
        isEnables[weight] = false
    }
    
    /// Valid only if Weight == listUnweighted.
    public mutating func append() {
        guard isUnweighted else { return }
        count += 1
    }
    
    public mutating func remove() {
        guard isUnweighted else { return }
        count -= 1
        if count == 0 { weights = [] }
    }
    
    /// Valid only if Weight != listUnweighted.
    public mutating func append(_ weight: Weight) {
        guard !isUnweighted else { return }
        weights.insert(weight)
        count = weights.count
        isEnables[weight] = true
    }
    
    public mutating func remove(by weight: Weight) {
        guard !isUnweighted else { return }
        guard weights.isEmpty else { return }
        weights.remove(weight)
        count = weights.count
        isEnables[weight] = nil
    }
    
}

/// - Tag: ListUndirectedEdge
/**
  Self-Loop:
  +-- w -+
  w      ↓
  |    +---+
  +--->| u |
       +---+
 
 Or
 
  U <=> V:
  +---+           +---+
  | u | <== w ==> | v |
  +---+           +---+
 */
public struct ListUndirectedEdge<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListSingleEdgeProtocol {
    
    public typealias VertexElement = Element
    public typealias Weight = Weight
    
    /// - Tag: Enable
    public var isEnable: Bool {
        get { isEnables[weight]! }
        set { isEnables[weight] = newValue }
    }
    
    public var isDisable: Bool {
        get { !isEnables[weight]! }
        set { isEnables[weight] = !newValue }
    }
    
    public var isEnables: [Weight: Bool] = [:]
    
    /// - Tag: Properties
    public var uFrom: ListVertex<Element>
    public var uTo: ListVertex<Element>
    
    public var vFrom: ListVertex<Element> {
        get { uTo }
        set { uTo = newValue }
    }
    
    public var vTo: ListVertex<Element> {
        get { uFrom }
        set { uFrom = newValue }
    }
    
    /// - Tag: Weight
    public var weight: Weight {
        willSet {
            self.isEnables[newValue] = isEnables[weight]
            isEnables[weight] = nil
        }
    }
    
    /// - Tag: Self-Loops
    public var isSelfLoop: Bool {
        uFrom == uTo
    }
    
    /// - Tag: Directed
    public var isDirected: Bool {
        false
    }
    
    /// - Tag: Mutil
    public var isMutil: Bool {
        false
    }
    
    /// - Tag: Directed Edges
    public var diedgeInfos: [ListEdgeInfo<Element, Weight>] {
        [
            .init(from: uFrom.data, to: uTo.data, weight: weight),
            .init(from: vFrom.data, to: vTo.data, weight: weight)
        ]
    }
    
    public var diedges: [ListDirectedEdge<Element, Weight>] {
        [
            .init(from: uFrom, to: uTo, weight: weight),
            .init(from: vFrom, to: vTo, weight: weight)
        ]
    }
    
    /// - Tag: Init
    public init(vertex: ListVertex<Element>, weight: Weight) {
        self.uFrom = vertex
        self.uTo = vertex
        self.weight = weight
        self.isEnable = true
    }
    
    public init(vertex1: ListVertex<Element>, vertex2: ListVertex<Element>, weight: Weight) {
        self.uFrom = vertex1
        self.uTo = vertex2
        self.weight = weight
        self.isEnable = true
    }
    
    internal init(edgeInfo: ListEdgeInfo<Element, Weight>) {
        self.uFrom = .init(data: edgeInfo.from)
        self.uTo = .init(data: edgeInfo.to)
        self.weight = edgeInfo.weight
        self.isEnable = true
    }
    
}

extension ListUndirectedEdge {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.uFrom == rhs.uFrom &&
        lhs.uTo == rhs.uTo &&
        lhs.isDirected == rhs.isDirected &&
        lhs.isMutil == rhs.isMutil &&
        (isUnweighted ? true : lhs.weight == rhs.weight)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uFrom)
        hasher.combine(uTo)
        hasher.combine(isDirected)
        hasher.combine(isMutil)
        if !isUnweighted { hasher.combine(weight) }
    }
    
}

extension ListUndirectedEdge {
    
    public var reverse: Self {
        .init(vertex1: uTo, vertex2: uFrom, weight: weight)
    }
    
}

/// - Tag: ListDirectedEdge
/**
  Self-Loop:
  +-- w -+
  |      ↓
  |    +---+
  +--->| u |
       +---+

 Or
 
  U -> V:
  +---+           +---+
  | u | --- w --> | v |
  +---+           +---+
 
 Or
 
  V -> U:
  +---+           +---+
  | u | <-- w --- | v |
  +---+           +---+
 */
public struct ListDirectedEdge<Element: ListGraphVertexable, Weight: ListGraphWeightable>: ListSingleEdgeProtocol {
    
    public typealias VertexElement = Element
    public typealias Weight = Weight
    
    /// - Tag: Enable
    public var isEnable: Bool {
        get { isEnables[weight]! }
        set { isEnables[weight] = newValue }
    }
    
    public var isDisable: Bool {
        get { !isEnables[weight]! }
        set { isEnables[weight] = !newValue }
    }
    
    public var isEnables: [Weight: Bool] = [:]
    
    /// - Tag: From-To
    public var from: ListVertex<Element>
    public var to: ListVertex<Element>
    public var weight: Weight {
        willSet {
            self.isEnables[newValue] = isEnables[weight]
            isEnables[weight] = nil
        }
    }
    
    /// - Tag: Self-Loops
    public var isSelfLoop: Bool {
        from == to
    }
    
    /// - Tag: Directed
    public var isDirected: Bool {
        true
    }
    
    /// - Tag: Mutil
    public var isMutil: Bool {
        false
    }
    
    /// - Tag: Directed Edges
    public var diedgeInfos: [ListEdgeInfo<Element, Weight>] {
        [.init(from: from.data, to: to.data, weight: weight)]
    }
    
    public var diedges: [ListDirectedEdge<Element, Weight>] {
        [self]
    }
    
    /// - Tag: Init
    public init(vertex: ListVertex<Element>, weight: Weight) {
        self.from = vertex
        self.to = vertex
        self.weight = weight
        self.isEnable = true
    }
    
    public init(from: ListVertex<Element>, to: ListVertex<Element>, weight: Weight) {
        self.from = from
        self.to = to
        self.weight = weight
        self.isEnable = true
    }
    
    internal init(edgeInfo: ListEdgeInfo<Element, Weight>) {
        self.from = .init(data: edgeInfo.from)
        self.to = .init(data: edgeInfo.to)
        self.weight = edgeInfo.weight
        self.isEnable = true
    }
    
}

extension ListDirectedEdge {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from &&
        lhs.to == rhs.to &&
        lhs.isDirected == rhs.isDirected &&
        lhs.isMutil == rhs.isMutil &&
        (isUnweighted ? true : lhs.weight == rhs.weight)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
        hasher.combine(isDirected)
        hasher.combine(isMutil)
        if !isUnweighted { hasher.combine(weight) }
    }
    
}

extension ListDirectedEdge: CustomStringConvertible, CustomDebugStringConvertible {
  
    public var description: String {
        isUnweighted ? "[ \(from) -> \(to) ]"
                     : "[ \(from) -> \(to), weight: \(weight) ]"
    }
    
    public var debugDescription: String {
        isUnweighted ? "\(from) --> \(to)"
                     : "\(from) - \(weight) -> \(to)"
    }
    
}

extension ListDirectedEdge {
    
    public var reverse: Self {
        .init(from: to, to: from, weight: weight)
    }
    
}

// MARK: Edge Info
public struct ListEdgeInfo<Element: ListGraphVertexable, Weight: ListGraphWeightable>: Hashable, CustomStringConvertible {
    
    public var from: Element
    public var to: Element
    public var weight: Weight
    
    public init(from: Element, to: Element, weight: Weight) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    public var description: String {
        Weight.self == ListUnweighted.self
            ? "[\(from) --> \(to), weight = \((weight as! ListUnweighted).value)]"
            : "[\(from) --> \(to), weight = \(weight)]"
    }
}

extension ListEdgeInfo {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from &&
        lhs.to == rhs.to &&
        lhs.weight == rhs.weight
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from)
        hasher.combine(to)
        hasher.combine(weight)
    }
    
}

// MARK: Path Info
public struct ListPathInfo<Element: ListGraphVertexable, Weight: ListGraphWeightable>: Hashable, CustomStringConvertible {
    
    public var weight: Weight
    
    public typealias EdgeInfos = [ListEdgeInfo<Element, Weight>]
    public var edgeInfos: EdgeInfos = []
    
    public init() {
        self.weight = .zero
    }
    
    public init(weight: Weight) {
        self.weight = weight
    }
    
    public init(weight: Weight, edgeInfos: [ListEdgeInfo<Element, Weight>]) {
        self.weight = weight
        self.edgeInfos = edgeInfos
    }

    public var description: String {
        Weight.self == ListUnweighted.self
            ? "[weight = \((weight as! ListUnweighted).value), edgeInfos = \(edgeInfos)]"
            : "[weight = \(weight), edgeInfos = \(edgeInfos)]"
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        var result = Self()
        result.weight = lhs.weight + rhs.weight
        result.edgeInfos = lhs.edgeInfos + rhs.edgeInfos
        return result
    }
    
}

extension ListPathInfo {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.weight == rhs.weight &&
        lhs.edgeInfos == rhs.edgeInfos
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(weight)
        hasher.combine(edgeInfos)
    }
    
}

extension ListPathInfo {
    
    public var reverse: Self {
        var result = Self()
        result.weight = self.weight
        result.edgeInfos = self.edgeInfos.reversed()
        return result
    }
    
}

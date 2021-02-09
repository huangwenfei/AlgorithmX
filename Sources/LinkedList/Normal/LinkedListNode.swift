//
//  LinkedListNode.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public class LinkedListNode<Element> {
  
    public var element: Element?
    public weak var prev: LinkedListNode<Element>?
    public var next: LinkedListNode<Element>?

    public init(prev: LinkedListNode<Element>? = nil, element: Element?, next: LinkedListNode<Element>? = nil) {
        self.prev = prev
        self.element = element
        self.next = next
    }
}

extension LinkedListNode: CustomStringConvertible {
  
    private func elementStr(_ e: Element?) -> String {
        (e == nil ? "nil" : "\(e!)")
    }
    
    public var description: String {
        
        if prev == nil && next == nil { return elementStr(element) }
        
        if prev == nil && next != nil {
            return elementStr(element) + " -> " + elementStr(next?.element)
        }
        
        if prev != nil && next == nil {
            return elementStr(prev?.element) + " -> " + elementStr(element)
        }
        
        return
            elementStr(prev?.element) + " <- " +
            elementStr(element) + " -> " +
            elementStr(next?.element)
    }
}

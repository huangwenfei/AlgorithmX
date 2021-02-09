//
//  CircleLinkedListNode.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public class CircleLinkedListNode<Element> {
  
    public var element: Element
    public weak var prev: CircleLinkedListNode<Element>?
    public var next: CircleLinkedListNode<Element>?

    public init(prev: CircleLinkedListNode<Element>? = nil, element: Element, next: CircleLinkedListNode<Element>? = nil) {
        self.prev = prev
        self.element = element
        self.next = next
    }
}

extension CircleLinkedListNode: CustomStringConvertible {
    
    private func elementStr(_ e: Element?) -> String {
        (e == nil ? "nil" : "\(e!)")
    }
  
    public var description: String {
        
        if prev == nil && next == nil { return "\(element)" }
        
        if prev == nil && next != nil {
            return "\(element)" + " -> " + elementStr(next?.element)
        }
        
        if prev != nil && next == nil {
            return elementStr(prev?.element) + " <- " + "\(element)"
        }
        
        return
            elementStr(prev?.element) + " <- " +
            "\(element)" + " -> " +
            elementStr(next?.element)
    }
}

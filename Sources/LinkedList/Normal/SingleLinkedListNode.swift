//
//  SingleLinkedListNode.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public class SingleLinkedListNode<Element> {
  
    public var element: Element?
    public var next: SingleLinkedListNode<Element>?

    public init(element: Element?, next: SingleLinkedListNode<Element>? = nil) {
        self.element = element
        self.next = next
    }
}

extension SingleLinkedListNode: CustomStringConvertible {
  
    private func elementStr(_ e: Element?) -> String {
        (e == nil ? "nil" : "\(e!)")
    }
    
    public var description: String {
        guard let next = next else { return elementStr(element) }
        return elementStr(element) + " -> " + elementStr(next.element)
    }
}

//
//  SingleCircleLinkedListNode.swift
//  AlgorithmX
//
//  Created by 黄文飞 on 2021/1/3.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import Foundation

public class SingleCircleLinkedListNode<Element> {
  
    public var element: Element
    public var next: SingleCircleLinkedListNode<Element>?

    public init(element: Element, next: SingleCircleLinkedListNode<Element>? = nil) {
        self.element = element
        self.next = next
    }
}

extension SingleCircleLinkedListNode: CustomStringConvertible {
  
    public var description: String {
        guard let next = next else { return "\(element)" }
        return "\(element)" + " -> " + .init(describing: next.element)
    }
}

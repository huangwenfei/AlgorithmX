//
//  AlgorithmXTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2020/12/19.
//  Copyright © 2020 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class AlgorithmXTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var queue = PriorityQueue<Double>(elements: [1.4, 22.8, 22.4, 12.3, 0.6, 0.4, 45.3, 21.3]) {
            $0 > $1
        }
        print(queue.elements)
        queue.enqueue(0.8)
        queue.enqueue(0.76)
        print(queue.elements)
    }

    func test() {
//        let graph = UULGraph<Int>()
//        let graph1 = UWLGraph<Int, Double>()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

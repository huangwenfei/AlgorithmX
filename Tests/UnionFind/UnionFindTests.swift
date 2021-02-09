//
//  UnionFindTests.swift
//  AlgorithmXTests
//
//  Created by 黄文飞 on 2021/1/16.
//  Copyright © 2021 黄文飞. All rights reserved.
//

import XCTest

import AlgorithmX

class UnionFindTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test() throws {
        var uf = UnionFind<Int>()

        for idx in 0 ..< 20 { uf.makeSet(idx) }
        
        uf.union(0, 1)
        uf.union(0, 3)
        uf.union(0, 4)
        uf.union(2, 3)
        uf.union(2, 5)
        
        uf.union(6, 7)

        uf.union(8, 10)
        uf.union(9, 10)
        uf.union(9, 11)
        
        XCTAssertFalse(uf.isSame(2, 7))

        uf.union(4, 6)
        
        XCTAssertTrue(uf.isSame(2, 7))
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

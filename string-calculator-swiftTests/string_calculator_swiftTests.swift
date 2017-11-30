//
//  string_calculator_swiftTests.swift
//  string-calculator-swiftTests
//
//  Created by Michael Richards on 11/30/17.
//  Copyright © 2017 Michael Richards. All rights reserved.
//

import Quick
import Nimble

@testable import string_calculator_swift

class string_calculator_swiftTests: QuickSpec {
    
    override func spec() {
        
        describe("String Calculator") {
            
            let stringCalculator = StringCalculator()
            
            describe("Adding Values") {
                
                it("Empty input should return 0") {
                    expect { try stringCalculator.add(String()) }.to(equal(0))
                }
                
                it("Single number should return same number") {
                    expect { try stringCalculator.add("1") }.to(equal(1))
                }
                
                it("Two numbers with commas should return sum") {
                    expect { try stringCalculator.add("1,2") }.to(equal(3))
                }
                
                it("Invalid input should return 0") {
                    expect { try stringCalculator.add("1;2;3;4") }.to(equal(0))
                }
                
                it("Ten numbers with commas should return sum") {
                    expect { try stringCalculator.add("1,2,3,4,5,6,7,8,9,10") }.to(equal(55))
                }
                
                it("Ten numbers with new lines should return sum") {
                    expect { try stringCalculator.add("1\n2\n3\n4\n5\n6\n7\n8\n9\n10") }.to(equal(55))
                }
                
                it("Ten numbers mixed with new lines and commas should return sum") {
                    expect { try stringCalculator.add("1,2\n3,4\n5,6\n7,8\n9,10") }.to(equal(55))
                }
                
                it("Three numbers mixed with new lines and commas should return sum") {
                    expect { try stringCalculator.add("1\n2,3") }.to(equal(6))
                }
                
                it("Double deliminators should print 0") {
                    expect { try stringCalculator.add("1,\n") }.to(equal(0))
                }
                
                it("Negatives should produce an exception") {
                    expect { try stringCalculator.add("-1,-2,-3") }.to(throwError())
                }
            }
        }
    }
}

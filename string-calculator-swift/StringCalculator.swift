//
//  StringCalculator.swift
//  string-calculator-swift
//
//  Created by Michael Richards on 11/30/17.
//  Copyright © 2017 Michael Richards. All rights reserved.
//

import Foundation

class StringCalculator {
    
    private let separators = CharacterSet.init(charactersIn: ",\n")
    
    enum AdditionError: Error {
        case NegativeNumbersUnsupported
    }
    
    func add(_ values: String) throws -> Int {
        
        do {
            return try sumOfIntArray(convertStringToIntArray(values))
        } catch let error {
            throw error
        }
    }
    
    private func convertStringToIntArray(_ stringValue: String) -> [Int?] {
        
        let valuesAsStringArray = stringValue.components(separatedBy: separators)
        
        return valuesAsStringArray.map { Int($0) }
    }
    
    private func sumOfIntArray(_ intArray: [Int?]) throws -> Int {
        
        guard intArray.filter({ $0 == nil }).isEmpty else {
            return 0
        }
        
        guard intArray.filter({ $0! < 0 }).isEmpty else {
            throw AdditionError.NegativeNumbersUnsupported
        }
        
        return Int(intArray.reduce(0) { $0 + $1! })
    }
}

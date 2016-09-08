//: Playground - noun: a place where people can play

import UIKit

var str = "Extensions"



extension Int {
    enum Kind {
        case positive, negative, zero
    }
    
    var kind: Kind {
        switch self {
        case 0 :
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


// Write a function that iterates thru an array and prints if an element is positive, negative or zero

func printKindOfNumbers(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .zero: print("0")
        case .positive: print("+")
        case .negative: print("-")
        }
        print("")
    }
}

printKindOfNumbers([0, 4, -5, 6, 19, -9])





//: [Previous](@previous)

import Foundation

var str = "Enum Equatability"

/*
 For a type to be Equatable, there must exist an implementation of the == operator function, which accepts a matching type:
 For VALUE types like struct/ enums, Equality is determining by comparing the values of all the components
 
 */

enum Example {
    case NumberTuple(one: Int, two: String)
    case StringTuple(oneStr: String, twoStr: String)
}


// Override the == operator and allow it to compare tuples
func == (lhs: Example, rhs: Example) -> Bool {
    switch(lhs, rhs) {
    case (.NumberTuple(let a, let b), .NumberTuple(let c, let d)) where (a == c && b == d) :
        return true
    default:
        return false
    }
}

Example.NumberTuple(one: 1, two: "one") == Example.NumberTuple(one: 1, two: "one")



//: [Next](@next)

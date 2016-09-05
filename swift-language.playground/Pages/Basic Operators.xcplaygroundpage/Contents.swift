//: Playground - noun: a place where people can play

import UIKit

var str = "Basic Operators"


//------------------------------------------------------------------------------------//
// Unary Minus Operator - Returns a negative Value
let six = 6
let minusSix = -six


//------------------------------------------------------------------------------------//
// Unary Plus Operator - Returns the same value
let seven = 7
let plusSeven = +seven


//------------------------------------------------------------------------------------//
// Tuple Comparison 
// MARK: Tuple Matching only operates on tuples that contain 6 elements or less, beyond that it fails
if ("firstname", "lastname", 1, 2, 3, 4) == ("firstname", "lastname", 1, 2, 3, 4) {
    print("Tuple Matched!!")
}

/*
 * EXAMPLE where TUPLE comparison fails
if ("firstname", "lastname", 1, 2, 3, 4, 5) == ("firstname", "lastname", 1, 2, 3, 4, 5) {
    print("Tuple Matched!!")
}
*/


//------------------------------------------------------------------------------------//
// Nil-Coalescing Operator
// [USAGE] : ( a ?? b ) Equals the operation ( a != nil ? a! : b )

let red = "red"
var userColor: String? // optional value

var color = userColor ?? red
color = (userColor != nil) ? userColor! : red


//------------------------------------------------------------------------------------//
// Close Range Operator
// Used when you want an iteration over the entire range of elements including the last one
for index in 1...5 {
    index
}


//------------------------------------------------------------------------------------//
// Half-Open Range Operator
// Useful when you want to iterate on lists like arrays where the index is 1 minus the total count
for index in 1..<5 {
    index
}











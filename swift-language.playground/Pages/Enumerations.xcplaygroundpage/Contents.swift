//: [Previous](@previous)

import Foundation

var str = "Enumerations"

/*
 IMPORTANT NOTES
 
 1. Control flow statements that deal with enumerations have to be exhaustive, missing an enum value causes a compilation error
 2. When using associated values, a switch condition which only checks for the enum will also work as a generic case 
         switch barcode {
             case .upc:
                 "Inside upc barcode"
             case .qr:
                 "inside qr barcode"
         }
 3. Enumeration cases can also be prepopulated with data of the same type. These values are called RAW VALUES
 */


//------------------------------------------------------------------------------------//
// Enumeration Syntax
//------------------------------------------------------------------------------------//

enum CompassPoints {
    case north, south, east, west
}


var directionToHead = CompassPoints.east

switch directionToHead {
case .east:
    "Sun rises in the east"
case .west:
    "Sun sets in the west"
case .north:
    "Arctic is to the north"
case .south:
    "Antarctic is to the south"
}


//------------------------------------------------------------------------------------//
// Associated Values
/*
 Its possible for each case of an enumeration to have different data type values associated with it. These are also called as variants.
 */
//------------------------------------------------------------------------------------//

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qr(String)
}

var barcode = Barcode.upc(1, 2, 3, 4)
barcode
barcode = .qr("new QR Code")

// When associated values are not considered
switch barcode {
case .upc:
    "Inside upc barcode"
case .qr:
    "inside qr barcode"
}

// When associated values are used in the enum checks
switch barcode {
case .upc(let a, let b, let c, let d):
    "Inside upc barcode \(a) \(b) \(c) \(d)"
case .qr(let string):
    "inside qr barcode \(string)"
}


//------------------------------------------------------------------------------------//
// Raw Values
/*
    These values will not change over time once they are initialized
 */
//------------------------------------------------------------------------------------//
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case newLine = "\n"
    case carriageReturn = "\r"
}


//------------------------------------------------------------------------------------//
// Recursive Enums
//------------------------------------------------------------------------------------//

/*

OPTION 1 - use indirect keyword with each case that is recursive
 
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
*/


// Option 2 - Use indirect keyword in the enum declaration
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(expression: left) + evaluate(expression: right)
    case .multiplication(let left, let right):
        return evaluate(expression: left) * evaluate(expression: right)
    }
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let six = ArithmeticExpression.number(6)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(six, sum)

evaluate(expression: product)











//: [Next](@next)

//: [Previous](@previous)

import Foundation

var str = "Recursive Enums"


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

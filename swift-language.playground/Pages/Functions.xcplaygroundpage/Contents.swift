//: [Previous](@previous)

import Foundation

var str = "Functions playground"

//------------------------------------------------------------------------------------//
// Functions with argument labels
// Argument labels are labels that are used in place of parameter names in the function
// and are added mainly for improved readability
func someFunctionWithArgLabel(argumentLabel parameterName: Int) {
    // do something here
}
someFunctionWithArgLabel(argumentLabel: 1)



//------------------------------------------------------------------------------------//
// Functions with no argument labels
func someFunctionWithNoArgLabel(_ parameterName: Int) {
    // do something here
}
someFunctionWithNoArgLabel(10)



//------------------------------------------------------------------------------------//
// Variadic Parameters
// - Are used when a function can be passed any number of input parameters

func mean(_ numbers: Double...) -> Double {
    var sum: Double = 0
    for number in numbers {
        sum += number
    }
    return sum / Double(numbers.count)
}

mean(1, 2, 3, 4, 5, 6)


//------------------------------------------------------------------------------------//
// inout parameters
// - Used when passing parameters by reference

func swap(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var one = 1
var two = 2
swap(&one, &two)
one
two


//------------------------------------------------------------------------------------//
// Function Types
// - function signatures can be used as types

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// Creates a variable that maps to a pre declared function
var aRandomMathFunction: (Int, Int) -> Int = addTwoInts

// Create an array of functions having types (Int, Int) -> Int
var mathFunctions: [(Int, Int) -> Int] = [addTwoInts, multiplyTwoInts]


//------------------------------------------------------------------------------------//
// Passing parameters of function types to a function

typealias binaryOperationType = (Int, Int) -> Int

func printOutput(_ mathFunction: binaryOperationType, _ a: Int, _ b: Int) {
    mathFunction(a, b)
}

printOutput(addTwoInts, 10, 20)


//------------------------------------------------------------------------------------//
// Return a function type from a function
// This is also an example of nested functions

typealias stepperType = (Int) -> Int

func selectStepper(backward: Bool) -> stepperType {
    func stepForward(_ a: Int) -> Int { return a + 1 }
    func stepBackward(_ a: Int) -> Int { return a - 1 }
    return backward ? stepBackward : stepForward
}

var stepper = selectStepper(backward: true)
stepper(10)
stepper = selectStepper(backward: false)
stepper(10)


//: [Next](@next)

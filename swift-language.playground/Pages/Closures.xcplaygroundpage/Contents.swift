//: [Previous](@previous)

import Foundation

var str = "Closures Playground"

//------------------------------------------------------------------------------------//
// Standard Closure Example

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        // Since dictionary subscript returns an optional
        // this ?? operator will force unwrap the value, and set a default if nil
        output = (digitNames[number % 10] ?? "") + output
        number = number / 10
    } while number > 0
    return output
}
strings


//------------------------------------------------------------------------------------//
// CAPTURE VALUE FROM SURROUNDING CONTEXT
//------------------------------------------------------------------------------------//
/*  
 DISCUSSION:
 
 incrementer captures the value of total & amount by reference thus everytime
 the function is called, it will add the amount to total and return a new value
 */

typealias incFuncType = () -> Int

func generateIncrementer(incrementBy amount: Int) -> incFuncType {
    var total = 0
    func incrementer() -> Int {
        total += amount
        return total
    }
    return incrementer
}

let incrementByTen = generateIncrementer(incrementBy: 10)
incrementByTen()
incrementByTen()


//------------------------------------------------------------------------------------//
// NON ESCAPING CLOSURES
//------------------------------------------------------------------------------------//
/*
 DISCUSSION:
 
 A closure is said to escape a function when a closure is passed as an argument to the function but executes after the function returns.
 
 By marking a closure as @noescape, allows the compiler to make aggressive optimizations as it now knows the closures lifespan
 */

typealias ClosureType = () -> Void

func someFuncWithNonEscapeClosure(completion: ClosureType) {
    completion()
}

var completions: [ClosureType] = []
func someFuncWithEscapeClosure(completion: ClosureType) {
    completions.append(completion)
}

class SomeSampleClass {
    var x = 10
    func doSomething() {
        someFuncWithNonEscapeClosure { self.x = 100 }
        someFuncWithEscapeClosure { self.x = 200 }
    }
}

let instance = SomeSampleClass()
instance.doSomething()
instance.x      // - This is an output of the no escape call
completions.first?()
instance.x      // - This is an output of the escaped closure call



//------------------------------------------------------------------------------------//
// AUTO CLOSURES
//------------------------------------------------------------------------------------//
/*
 DISCUSSION:
    
 An Auto Closure wraps an expression, it does not take any arguments and when called it will evaluate the expression that was passed to it.
 */

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var customer = {customersInLine.remove(at: 0)}
var waitingQueue = {customersInLine.count}

func serve(customer customerProcessed: () -> String ) {
    "Serving customer \(customerProcessed())"    
}

serve(customer: customer)
serve { customersInLine.remove(at: 0)}


//: [Next](@next)

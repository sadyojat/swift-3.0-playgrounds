//: [Previous](@previous)

import Foundation

var str = "Struct vs Class"


/*
 In this example, we assign an instance of a struct and a class to a constant
 The biggest difference in behavior is that
 - The struct property CANNOT be changed even when its a var once the constant assignment happens
 - The class instance property can be changed even after its assigned to a constant.
 
 The reason, is that structs are value types. The entire struct instance is copied over to a constant, and that value can never be changed, while class is a reference type, and hence the variable property can be changed.
 
 */
struct SomeStruct {
    var someString: String
}

let someStruct = SomeStruct(someString: "newValue")
//someStruct.someString = "changed value"
someStruct.someString


class SomeClass {
    var someString: String
    
    init(someString: String) {
        self.someString = someString
    }
}

let someClass = SomeClass(someString: "newValue")
someClass.someString = "changed value"
someClass.someString




//: [Next](@next)

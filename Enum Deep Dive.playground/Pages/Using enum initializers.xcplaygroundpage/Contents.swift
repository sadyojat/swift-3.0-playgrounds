//: [Previous](@previous)

import Foundation

var str = "Using Enum initializers"


// Using a normal init
enum WarehouseCategory {
    case Small, Medium, Large, Massive
    
    init(size number: Int) {
        if number < 100 { self = .Small }
        else if number >= 100 && number < 1000 { self = .Medium }
        else if number >= 1000 && number < 10000 { self = .Large }
        else { self = .Massive }
    }
}

let warehouse = WarehouseCategory(size: 1024)
warehouse


// Example with a failable init

enum ProductName {
    case AppleWatch
    
    init?(name: String) {
        if name == "iWatch" { self = .AppleWatch }
        else { return nil }
    }
}

ProductName(name: "iWatch")
ProductName(name: "Macbook Pro")



//: [Next](@next)

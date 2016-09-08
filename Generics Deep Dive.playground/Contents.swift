//: Playground - noun: a place where people can play

import UIKit

var str = "Generics Deep Dive"


struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.removeLast()
    }
}


extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("hello")
//stackOfStrings.pop()
stackOfStrings.topItem
stackOfStrings.topItem
stackOfStrings.topItem
stackOfStrings.topItem







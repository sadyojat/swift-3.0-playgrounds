//: [Previous](@previous)

import Foundation

var str = "Mutating Functions in Enums"

enum StateMachine {
    case Start, End, Execute, Terminate
    
    mutating func next(exception flag: Bool) {
        guard !flag else {
            self = .Terminate
            return
        }
        switch self {
        case .Start:
            self = .Execute
        case .End, .Terminate:
            self = .Start
        case .Execute:
            self = .End
        }
    }
}

var stateMachine = StateMachine.Start
stateMachine.next(exception: false)
stateMachine
stateMachine.next(exception: true)
stateMachine







//: [Next](@next)

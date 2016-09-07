//: [Previous](@previous)

import Foundation

var str = "Enum Extensions"

/*
 Enums can conform to protocols, and hence protocol extensions can be created
 */

enum Programmer { case Beginner, Mediocre, Expert }

protocol SoftSkill {
    func promotesGroupDiscussion() -> Bool
    func showsGrowthPromise() -> Bool
}

extension Programmer: SoftSkill {
    func promotesGroupDiscussion() -> Bool {
        switch self {
        case .Beginner:
            return false
        case .Mediocre:
            return false
        case .Expert:
            return true
        }
    }
    
    func showsGrowthPromise() -> Bool {
        switch self {
        case .Beginner:
            return false
        case .Mediocre:
            return false
        case .Expert:
            return true
        }
    }
}

var programmer = Programmer.Beginner
programmer.promotesGroupDiscussion()
programmer = Programmer.Expert
programmer.promotesGroupDiscussion()



//: [Next](@next)

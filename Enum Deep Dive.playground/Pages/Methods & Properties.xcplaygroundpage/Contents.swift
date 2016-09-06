//: [Previous](@previous)

import Foundation

var str = "Methods & Properties"

/*
 Methods can be defined over enums, and those can be customized to return values types of interest. For instance in this example, we use the attributes method to return a tuple that returns the armor and the weight of the headgear.
 
 Only COMPUTED PROPERTIES are allowed in enums. This is because enums are not instance types, they are value types only.
 */
enum HeadGear {
    enum Armor { case Wooden, Metal, Kevlar }
    enum Weight { case Light, Heavy }
    enum Color { case Black, Blue }
    enum Sigil { case Lion, Dragon }
    
    case Helmet(Armor, Weight, Color, Sigil)
    
    // Only computed properties can be used here
    var manufacturer: String {
        switch self {
        case .Helmet(let armor, let weight, let color, let sigil):
            if armor == .Kevlar && weight == .Light && color == .Black && sigil == .Dragon {
                return "SomeAdvancedManufacturer"
            } else {
                return "SomeOldTechnologyManufacturer"
            }
        }
    }
    
    func primaryAttributes() -> (Armor, Weight) {
        switch self {
        case .Helmet(let armor, let weight, _, _):
            return (armor, weight)
        }
    }
    
    func allAttributes() -> (Armor, Weight, Color, Sigil) {
        switch self {
        case .Helmet(let armor, let weight, let color, let sigil):
            return (armor, weight, color, sigil)
        }
    }
}

// initialize the tuple property for the helmet
let infantryHelmet = HeadGear.Helmet(.Kevlar, .Heavy, .Black, .Dragon)

// access the primary and all attributes
infantryHelmet.primaryAttributes()
infantryHelmet.allAttributes()

// access the computed property
infantryHelmet.manufacturer




//: [Next](@next)

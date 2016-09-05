//: [Previous](@previous)

import Foundation

var str = "ARC"

//------------------------------------------------------------------------------------//
// ARC in action
//------------------------------------------------------------------------------------//

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        "\(name) is being initialized"
    }
    
    deinit {
        "\(name) is being deinitialized"
    }
}


/*
 These variables are optional types and hence automatically initialized to nil
 */
var reference1: Person?
var reference2: Person?
var reference3: Person?

/*
 An allocation creates a strong reference in memory
 */
reference1 = Person(name: "Jonas")


/*
 Add 2 more strong references to reference1 object instance
 */
reference2 = reference1
reference3 = reference1

/*
 Try by setting nil to any 2 instances - notice that deinit is still not called
 */
reference1 = nil
reference2 = nil

// At this point deinit will be called, indicating all strong references are removed from that instance
reference1 = nil


//------------------------------------------------------------------------------------//
// RESOLVE STRONG REFERENCE CYCLES using UNOWNED
//------------------------------------------------------------------------------------//

class Tenant {
    let name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    
}

class Apartment {
    let unitName: String
    unowned var tenant: Tenant // This results in an unowned reference i.e NOT A STRONG reference
    init(unitName: String, tenant: Tenant) {
        self.unitName = unitName
        self.tenant = tenant
    }
}

var tenant = Tenant(name: "Tenant1")
var apartment = Apartment(unitName: "Apartment1", tenant: tenant)
tenant.apartment = apartment






//: [Next](@next)

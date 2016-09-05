//: [Previous](@previous)

import Foundation

var str = "ARC"

/*
 IMPORTANT NOTES
 
 1. object instances marked with unowned references are not optionals, it just means that they do not have a strong reference
 2. Use unowned reference when both the referencing object and the referenced object can be deallocated at the same time
 3. Use weak when its possible that the referenced object might get deallocated during the course of execution of the method context.
 4. CAPTURE LISTS are important when trying to break reference cycles in closures. pass the list of object instances along with either a weak or unowned reference that might be necessary in that closure context.
 */



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


//------------------------------------------------------------------------------------//
// CLOSURES & REFERENCES
//------------------------------------------------------------------------------------//

/*
 In this example the use of self within the asHTML closure causes the closure to hold a strong reference
 Thus even if header instance is set to nil, that wouldnt release the reference to it, causing a memory leak
 The way around this is to use CAPTURE LISTS
 */
class HTMLElement {
    var name: String
    var text: String?
    
    init(name: String, text: String?) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("De-initializing \(self.name)")
    }
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "</\(self.name)>"
        }
    }
}

var header: HTMLElement? = HTMLElement(name: "h1", text: "Ola")
header!.asHTML()
header = nil






//: [Next](@next)

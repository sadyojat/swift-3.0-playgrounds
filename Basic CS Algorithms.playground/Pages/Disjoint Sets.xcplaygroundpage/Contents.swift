//: [Previous](@previous)

import Foundation

var str = "Disjoint Sets"


/*
 In Mathematical parlance two sets are called DISJOINT, if they do not have any elements in common
 
 Problem Area:
 -------------
 Consider a room filled with N people, and let us assume that an acquaintance is a person known either directly or indirectly. Then if say A and B are direct acquaintances and B and C are direct acquaintances then we can assume that A & C are acquaintances too.
 
 This is a common problem in social networking, and disjoint sets can be used to find such relationships between elements of that network
 
 
 Operations:
 -----------
 - makeset
    - This operation creates a set with only one element in it
 
 - union
    - Takes 2 different sets and merges them into one
 
 - findset
    - Returns the representative element of a set

 Data element:
 -------------
 Node 
    - rank
    - value
    - parent pointer
 
 Complexity:
 -----------
 Space - O(n)
 Time - O(m) - m is the total number of operations
 
 */

var attendees = ["Tim Cook", "Robin Hood", "Barack Obama", "Narendra Modi", "Sundar Pichai", "Jeff Bezos", "Mark Zuckerberg", "Vishal Sikka"]


class Person: Hashable, Equatable {
    /// rank of the node in the disjoint set, higher the rank, more acquaintences the person has
    var rank: Int
    
    /// persons name
    var name: String
    
    /// indicates the parent relationship in the treee
    var parent: Person? = nil
    
    /// hashvalue of the node
    var hashValue: Int { return self.hashValue }
    
    init(_ name: String, _ rank: Int) {
        self.name = name
        self.rank = rank
    }
    
    static func == (l: Person, r: Person) -> Bool {
        return l.name == r.name
    }
}


struct PeopleMap {
    
    /// List of all people in the sample space
    var list: [String]
    
    /// The list of all Person instances mapped from the people names
    var nodes:[Person] = [Person]()
    
    /// Generates a Person node from a person name
    ///
    /// - parameter name: Name of the person on the list
    ///
    /// - returns: an instance of Person class
    private static func makeSet(_ name: String) -> Person { return Person(name, 0) }
    
    /// Finds of the person exists in the node list
    ///
    /// - parameter name: name of the person
    ///
    /// - returns: person instance from the list
    func find(_ name: String) -> Person? {
        var result = nodes.filter { return $0.name.lowercased() == name.lowercased() }
        return (result.count > 0) ? result[0] : nil
    }
 
    /// Generates a relationship between the two person instances
    ///
    /// - parameter a: person 1
    /// - parameter b: person 2
    func union(first a: inout Person, second b: inout Person) {
        while a.parent != nil { a = a.parent! }
        while b.parent != nil { b = b.parent! }
        if a.rank > b.rank {
            b.parent = a
            a.rank += 1
        } else {
            a.parent = b
            b.rank += 1
        }
    }
    
    /// Find the set in which the person belongs to
    ///
    /// - parameter name: Person name
    ///
    /// - returns: the instance of Person class
    private func findSet(name: String) -> Person? {
        var node = find(name)
        while node?.parent != nil { node = node?.parent! }
        return node
    }
    
    func relate(first a: String, second b: String) {
        guard var p1 = find(a), var p2 = find(b) else { return }
        union(first: &p1, second: &p2)
    }
    
    func knows(first a: String, second b: String) -> Bool {
        return findSet(name: a) == findSet(name: b)
    }
    
    init(list: [String]) {
        self.list = list
        self.nodes = list.map { PeopleMap.makeSet($0)}
    }
    
}

// ----- TEST SCENARIOS ----- //


// Build a data set with the list of peoples names and nodes
var peopleMap = PeopleMap(list:attendees)

// Build relationships
peopleMap.relate(first: "Tim Cook", second: "Barack Obama")
peopleMap.relate(first: "Sundar Pichai", second: "Tim Cook")
peopleMap.relate(first: "Vishal Sikka", second: "Narendra Modi")
peopleMap.relate(first: "Vishal Sikka", second: "Barack Obama")
peopleMap.relate(first: "Mark Zuckerberg", second: "Narendra Modi")
//peopleMap.relate(first: "Narendra Modi", second: "Barack Obama")

peopleMap.nodes

// Validate if they know each other
peopleMap.knows(first: "Tim Cook", second: "Sundar Pichai")
peopleMap.knows(first: "Jon Appleseed", second: "Sundar Pichai")

//: [Next](@next)

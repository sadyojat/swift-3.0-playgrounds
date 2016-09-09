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
    var hashValue: Int {
        return self.hashValue
    }
    
    init(_ name: String, _ rank: Int) {
        self.name = name
        self.rank = rank
    }
    
    static func == (l: Person, r: Person) -> Bool {
        return l.hashValue == r.hashValue
    }
}

func makeSet(_ name: String) -> Person {
    return Person(name, 0)
}

var nodes = attendees.map {makeSet($0)}







//: [Next](@next)

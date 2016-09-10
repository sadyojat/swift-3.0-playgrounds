//: [Previous](@previous)

import Foundation

var str = "Kruskal's Algorithm"


typealias NodePathType = (Int, Int, Double)

var weightedGraph:[NodePathType] = [
    (0, 3, 1),
    (3, 4, 6),
    (4, 5, 2),
    (5, 2, 4),
    (2, 1, 1),
    (1, 0, 3),
    (1, 3, 3),
    (2, 4, 4)
]


func == (lhs: NodePathType, rhs: NodePathType) -> Bool {
    return ((lhs.0 == rhs.0 && lhs.1 == rhs.1 && lhs.2 == rhs.2)
        || (lhs.0 == rhs.1 && lhs.1 == rhs.0 && lhs.2 == rhs.2))
}

var row = Array(repeating: 0, count: 6)
var matrix:[[Double]] = Array(repeating: Array(repeating: 0, count: 6), count: 6)
for tuple in weightedGraph {
    matrix[tuple.0][tuple.1] = tuple.2
}






weightedGraph






//: [Next](@next)

//: [Previous](@previous)

import Foundation

var str = "Subscripts"


//------------------------------------------------------------------------------------//
// SUBSCRIPT USAGE
//------------------------------------------------------------------------------------//
struct TimesTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}


let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6]
threeTimesTable[10]


//------------------------------------------------------------------------------------//
// MULTIPLE PARAMETER SUBSCRIPTS
//------------------------------------------------------------------------------------//

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows:Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column),"Index is out of range")
            return grid[(row*columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column),"Index is out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 1.5
let value = matrix[0,0]



//: [Next](@next)

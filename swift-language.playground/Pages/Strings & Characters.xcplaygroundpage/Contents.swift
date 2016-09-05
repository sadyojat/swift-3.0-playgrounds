//: [Previous](@previous)

import Foundation

var str = "Strings & Characters"

//------------------------------------------------------------------------------------//
// Extended Grapheme Clusters - To create accented characters  é
// This enables us to combine unicode characters with normal alphabetic representation or other unicode characters
// DEV NOTE - The count property requires a complete iteration to determine if there are grapheme clusters in the string.

let eAcute = "\u{e9}"
let graphemeClusterAcute = "\u{65}\u{301}\u{20dd}"
let combinedAcute = "e\u{301}\u{20dd}"
let enclosingMark = "\u{20dd}"


//------------------------------------------------------------------------------------//
/*
 Quiz : Why are Swift strings not indexed using integer values. For instance str[10] will throw an error?
 
 -   Characters in a swift string take up different memory, due to the support for grapheme clusters. Due to this, the swift compiler has to iterate thru the entire string at least once to determine the count of valid characters in that string. Hence using an integer index will not work here. What we are actually looking for is that index position of each grapheme cluster within that string.
 */


//------------------------------------------------------------------------------------//
// String Index usages

let someString = "Hello Everyone, lets learn a little bit about String Indices!"
someString[someString.startIndex]
someString[someString.index(after: someString.startIndex)]
someString[someString.index(before: someString.endIndex)]
let index = someString.index(someString.startIndex, offsetBy: 3)
someString[index]


//------------------------------------------------------------------------------------//
// String Prefix/ Suffix

let prefixString = "prefix 1 : some string"
prefixString.hasPrefix("prefix 1")
prefixString.hasPrefix("1")

let suffixString = "some string : suffix 1"
suffixString.hasSuffix("suffix 1")


//------------------------------------------------------------------------------------//
// UTF 8 representation 
let dogString = "Dog‼🐶"
dogString.utf8
for codeunit in dogString.utf8 {
    codeunit
}



//: [Next](@next)

//: Playground - noun: a place where people can play

import UIKit

var str = "Nested Enums"

/*
 Enums can be nested as shown in the example below to enable collecting relevant information together.
 */

enum Family {
    case Lannister
    case Stark
    case Arryn
    case Tully
    case Baratheon
    case Tyrell
    case Martell
    
    enum Sigil {
        case Lion
        case Arrows
        case Broadsword
        case None
    }
    
    enum Bannermen {
        case LannisterBannermen
        case StarkBannermen
        case ArrynBannermen
        case TullyBannermen
        case None
    }
}

struct Kingdom {
    var family: Family
    var sigil: Family.Sigil
    var bannermen: Family.Bannermen
}

let lannister = Kingdom(family: .Lannister, sigil: .Lion, bannermen: .LannisterBannermen)






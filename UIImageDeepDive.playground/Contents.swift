//: Playground - noun: a place where people can play

import UIKit

var str = "UIImage Deep Dive"


/*
 Implement a lightweight ratings view which dynamically draws multiple images in the same UIImageView
 
 This can be easily achieved by drawing within the ImageContext listed below
 */



let emptyImage = UIImage(named: "images/empty-star")
let filledImage = UIImage(named: "images/filled-star")
let width = Double(emptyImage!.size.width)
let height = Double(emptyImage!.size.height)
let rating = 4.5


UIGraphicsBeginImageContextWithOptions(CGSize(width: width*5, height:height), false, 0.0)
for i in 0..<5 {
    let newX = width * Double(i)
    if Double(i+1) < rating {
        filledImage?.draw(at: CGPoint(x:newX, y:0))
    } else {
        let difference = (Double(i+1) - (rating))
        if  difference < 1 {
            difference
            let filledRef = (filledImage?.cgImage!)!.cropping(to: CGRect(origin: CGPoint.zero, size: CGSize(width: width*(1-difference), height: height)))
            let partialFilledImage = UIImage(cgImage: filledRef!)
            partialFilledImage.draw(at: CGPoint(x:newX, y:0))
            emptyImage?.draw(at: CGPoint(x:newX, y:0))
        } else {
            emptyImage?.draw(at: CGPoint(x:newX, y:0))
        }
        
    }
    
}
let img = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

let imageView = UIImageView(image: img)
imageView



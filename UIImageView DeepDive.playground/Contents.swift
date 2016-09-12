//: Playground - noun: a place where people can play

import UIKit
import CoreGraphics


var str = "UIImage Deep Dive"

let emptyImage = UIImage(named: "images/empty-star")
let filledImage = UIImage(named: "images/filled-star")


extension UIImageView {
    func rotate(by angleInDegrees: CGFloat) {
        self.backgroundColor = UIColor.red
        let degreesToRadians: (CGFloat) -> CGFloat = { return ($0 * CGFloat(M_PI) / 180.0 ) }
        let angleInRadians = degreesToRadians(angleInDegrees)
        let affineTransform = CGAffineTransform(rotationAngle: angleInRadians)
        self.transform = affineTransform
        let rotatedSize = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, 0.0)
        if let bitmap = UIGraphicsGetCurrentContext() {
            bitmap.translateBy(x: rotatedSize.width/2, y: rotatedSize.height/2)
            bitmap.rotate(by: angleInRadians)
            let newFrame = CGRect(x: -rotatedSize.width/2, y: -rotatedSize.height/2, width: rotatedSize.width, height: rotatedSize.height)
            if let cgImg = self.image?.cgImage {
                bitmap.draw(cgImg, in: newFrame)
            }
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
                self.image = newImage
            }
        }
        UIGraphicsEndImageContext()
    }
}

let sampleImageView = UIImageView(image: emptyImage!)
sampleImageView.rotate(by: 50)
sampleImageView.rotate(by: 20)
sampleImageView.rotate(by: 10)
sampleImageView.rotate(by: 20)







/*
 Implement a lightweight ratings view which dynamically draws multiple images in the same UIImageView
 
 This can be easily achieved by drawing within the ImageContext listed below
 */

//let emptyImage = UIImage(named: "images/empty-star")
//let filledImage = UIImage(named: "images/filled-star")


func ratingsImage(_ emptyImage: UIImage, _ filledImage: UIImage, value: Double) -> UIImage {
    let width = Double(emptyImage.size.width)
    let height = Double(emptyImage.size.height)
    let rating = value
    UIGraphicsBeginImageContextWithOptions(CGSize(width: width*5, height:height), false, 0.0)
    for i in 0..<5 {
        let newX = width * Double(i)
        if Double(i+1) < rating {
            filledImage.draw(at: CGPoint(x:newX, y:0))
        } else {
            let difference = (Double(i+1) - (rating))
            if  difference < 1 {
                difference
                let filledRef = (filledImage.cgImage!).cropping(to: CGRect(origin: CGPoint.zero, size: CGSize(width: width*(1-difference), height: height)))
                let partialFilledImage = UIImage(cgImage: filledRef!)
                partialFilledImage.draw(at: CGPoint(x:newX, y:0))
                emptyImage.draw(at: CGPoint(x:newX, y:0))
            } else {
                emptyImage.draw(at: CGPoint(x:newX, y:0))
            }
        }
    }
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return img!
}

let ratings = ratingsImage(emptyImage!, filledImage!, value: 3.5)
let imageView = UIImageView(image: ratings)





//------------------------------------------------------------------------------------------------------------------------------
/*
 Rotate an image View
 */
//let degreesToRadians: (CGFloat) -> CGFloat = { return $0 / 180.0 * CGFloat(M_PI) }
//let angleInRadians = degreesToRadians(90)
//let affineTransform = CGAffineTransform.init(rotationAngle: angleInRadians)
//imageView.transform = affineTransform
//let rotatedSize = CGSize(width: 256, height: 256)
//
//// Create a bitmap context 
//
//UIGraphicsBeginImageContextWithOptions(rotatedSize, false, 0.0)
//let bitmap = UIGraphicsGetCurrentContext()
//
//// Move the origin to the center of the context to rotate around it
//bitmap?.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height/2)
//bitmap?.rotate(by: angleInRadians)
//let newFrame = CGRect(x: -rotatedSize.width/2, y: -rotatedSize.height/2, width: rotatedSize.width, height: rotatedSize.height)
//bitmap?.draw((filledImage?.cgImage)!, in: newFrame)
//let newImage = UIGraphicsGetImageFromCurrentImageContext()
//UIGraphicsEndImageContext()
//let rotatedImageView = UIImageView(image: newImage!)









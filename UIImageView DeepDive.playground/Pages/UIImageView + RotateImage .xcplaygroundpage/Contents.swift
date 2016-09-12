//: [Previous](@previous)

import UIKit

var str = "Hello, playground"


extension UIImageView {
    func rotate(by angleInDegrees: CGFloat) {
        let degreesToRadians: (CGFloat) -> CGFloat = { return ($0 * CGFloat(M_PI))  / 180.0  }
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


let emptyImage = UIImage(named: "images/empty-star")
let sampleImageView = UIImageView(image: emptyImage!)
sampleImageView.backgroundColor = UIColor.darkGray
sampleImageView.rotate(by: 50)
sampleImageView.backgroundColor = UIColor.blue
sampleImageView.rotate(by: 20)
sampleImageView.backgroundColor = UIColor.red
sampleImageView.rotate(by: 10)
sampleImageView.backgroundColor = UIColor.brown
sampleImageView.rotate(by: 20)

//: [Next](@next)

//
//  UIImage+Utils.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit
extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

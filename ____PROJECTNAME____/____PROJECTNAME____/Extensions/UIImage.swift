//
//  UIImage.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 4/16/17.
//  Copyright © ____PROJECTNAME____. All rights reserved.
//

import UIKit

extension UIImage{
    public static func image(withColor color: UIColor, andSize size: CGSize) -> UIImage?{
        let scale = UIScreen.main.scale
        if scale > 1{
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
        }else{
            UIGraphicsBeginImageContext(size)
        }

        let context = UIGraphicsGetCurrentContext()
        //
        // Fill background of context
        //
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))

        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }
}

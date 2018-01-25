//
//  Fonts.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel Céspedes Lara on 1/24/18.
//  Copyright © ____PROJECTNAME____. All rights reserved.
//

import UIKit

extension App{
    struct Fonts {
//        public static func black(ofSize size: CGFloat = 17) -> UIFont{
//            return self.font("WhitneyHTF-Black", size: size)
//        }
        
        public static func font(_ fontName: String, size: CGFloat) -> UIFont{

            if let font = UIFont(name: fontName, size: size){
                return font
            }

            FontsManager.shared.dynamicallyLoadFont(fontName: fontName)

            if let font = UIFont(name: fontName, size: size){
                return font
            }
            return UIFont.systemFont(ofSize: size)
        }
    }
}

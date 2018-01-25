//
//  Fonts.swift
//  AppDomain
//
//  Created by Dani Manuel Céspedes Lara on 1/24/18.
//  Copyright © 2018 Dani Manuel Céspedes Lara. All rights reserved.
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

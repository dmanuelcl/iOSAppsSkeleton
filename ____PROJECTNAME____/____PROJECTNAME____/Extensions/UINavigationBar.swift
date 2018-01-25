//
//  UINavigationBar.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 2/26/17.
//  Copyright © ____PROJECTNAME____. All rights reserved.
//

import UIKit

public extension UINavigationBar{
    private struct associatedKeys {
        static var renderFullyTransparent: String = "renderFullyTransparent"
    }
    
    @IBInspectable var renderFullyTransparent: Bool {
        get{
            return associatedObject(base: self, key: &associatedKeys.renderFullyTransparent){
                return false
            }
        }
        set(value){
            associateObject(base: self, key: &associatedKeys.renderFullyTransparent, value: value)
            if value{
                self.setFullyTransparent()
            }
        }
    }
    
    public func setFullyTransparent(){
        let emptyImage = UIImage()
        self.setBackgroundImage(emptyImage, for: .default)
        self.backgroundColor = .clear
        self.shadowImage = emptyImage
        self.isTranslucent = true
    }

    public func resetFullyTransparent(withBackgroundColor backgroundColor: UIColor = .clear, isTranslucent: Bool = false){
        self.setBackgroundImage(nil, for: .default)
        self.backgroundColor = backgroundColor
        self.barTintColor = backgroundColor
        self.shadowImage = nil
        self.isTranslucent = isTranslucent
    }
}

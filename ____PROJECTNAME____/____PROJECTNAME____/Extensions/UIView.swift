//
//  UIView.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 2/5/17.
//  Copyright (c) ____PROJECTNAME____. All rights reserved.
//

import UIKit

class DesignableUIView: UIView{}
class DesignableUIButton: UIButton{}
class DesignableUITextField: UITextField{}

extension UIView{
    
    static var topWindow: UIWindow?{
        for window in UIApplication.shared.windows.reversed() {
            if window.windowLevel == UIWindowLevelNormal && window.isKeyWindow && window.frame != CGRect.zero { return window }
        }
        return UIApplication.shared.keyWindow
    }
    
    static var mainView: UIView?{
        return self.topWindow?.subviews.reversed().first
    }
}

@IBDesignable extension UIView{
    var width: CGFloat{
        return self.frame.width
    }
    
    var height: CGFloat{
        return self.frame.height
    }

    @IBInspectable var isCircular: Bool {
        get{
            return self.layer.cornerRadius != 0
        }
        set{
            if newValue{
                let cornerRadius = min(self.frame.width, self.frame.height)
                self.layer.cornerRadius = cornerRadius / 2
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get{
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set{
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get{
            guard self.layer.shadowColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set{
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
}



//
//  UIView+Designable.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel Céspedes Lara on 1/25/18.
//  Copyright © 2018 Dani Manuel Céspedes Lara. All rights reserved.
//

import UIKit

@IBDesignable class DesignableUIView: UIView {}
@IBDesignable class DesignableUIImageView: UIImageView {}
@IBDesignable class DesignableUIButton: UIButton {}
@IBDesignable class DesignableUITextField: UITextField {

    @IBInspectable
    var placeholderTextColor: UIColor = UIColor.lightGray {
        didSet {
            guard let placeholder = placeholder else {
                return
            }

            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor: placeholderTextColor])
        }
    }
}

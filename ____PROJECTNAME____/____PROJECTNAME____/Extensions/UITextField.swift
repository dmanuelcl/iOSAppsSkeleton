//
//  UITextField.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 9/26/17.
//  Copyright (c) ____PROJECTNAME____. All rights reserved.
//

import UIKit

extension UITextField{
    var defaultInputAccessoryView: UIView{
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let hideKeyboardAction = UIBarButtonItem(image: #imageLiteral(resourceName: "hide_keyboard"), style: .done, target: self, action: #selector(self.hideKeyboard))

        if self.keyboardAppearance == .dark{
            hideKeyboardAction.tintColor = .white
            toolbar.barTintColor = UIColor.black.withAlphaComponent(60)
        }
        toolbar.items = [flexibleItem, hideKeyboardAction]
        return toolbar
    }

    @objc func hideKeyboard(){
        self.resignFirstResponder()
    }
}

extension UITextField{
    var safeValue: String?{
        guard let value = self.text else {
            return nil
        }
        return value.isEmpty ? nil : value
    }
    var safePlaceholderValue: String?{
        guard let value = self.placeholder else {
            return nil
        }
        return value.isEmpty ? nil : value
    }
}

extension UITextField{
    private struct associatedKeys {
        static var uiTextFieldKey: String = "uiTextFieldKey"
    }
    
    @IBOutlet var nextTextField: UITextField?{
        get{
            return associatedObject(base: self, key: &associatedKeys.uiTextFieldKey){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &associatedKeys.uiTextFieldKey, value: value)
        }
    }
}


extension NSObject: UITextFieldDelegate{

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = textField.defaultInputAccessoryView
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = textField.nextTextField{
            nextTextField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
}


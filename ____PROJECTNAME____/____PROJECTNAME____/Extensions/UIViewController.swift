//
//  UIViewController.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 10/2/17.
//  Copyright (c) ____PROJECTNAME____. All rights reserved.
//

import UIKit

extension UIViewController {

    static func topViewController(base: UIViewController) -> UIViewController {
        
        if let navigationController = base as? UINavigationController {
            if let visibleViewController = navigationController.visibleViewController{
                return topViewController(base: visibleViewController)
            }
            return navigationController
        }
        
        if let tabBarController = base as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return topViewController(base: selectedViewController)
            }
            return tabBarController
        }
        
        if let presented = base.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }

    @IBAction func dissmisViewControllerAction(_ sender: AnyObject){
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func popViewController(_ sender: AnyObject){
        guard let _ = self.navigationController else {
            self.dissmisViewControllerAction(sender)
            return
        }

        if self.navigationController?.viewControllers.count == 1{
            self.dissmisViewControllerAction(sender)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func popToRootViewController(_ sender: AnyObject){
        guard let _ = self.navigationController else {
            self.dissmisViewControllerAction(sender)
            return
        }

        if self.navigationController?.viewControllers.count == 1{
            self.dissmisViewControllerAction(sender)
        }else{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

// MARK: - Extension para mostrar Alertas al usuario
extension UIViewController{

    public func showAlert(title: String?, message: String?, buttonTitle: String, okAction: ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okButton = UIAlertAction(title: buttonTitle, style: .default, handler: okAction)

        alertController.addAction(okButton)
        alertController.preferredAction = okButton

        self.present(alertController, animated: true, completion: nil)
    }


    public func showAlert(title: String?, message: String?, firstButtonTitle: String, secondButtonTitle: String, firstButtonAction: ((UIAlertAction) -> Void)? = nil, secondButtonAction: ((UIAlertAction) -> Void)? = nil){

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let firstButton = UIAlertAction(title: firstButtonTitle, style: .default, handler: firstButtonAction)

        let secondButton = UIAlertAction(title: secondButtonTitle, style: .destructive, handler: secondButtonAction)

        alertController.addAction(firstButton)
        alertController.addAction(secondButton)

        alertController.preferredAction = secondButton

        self.present(alertController, animated: true, completion: nil)
    }
}

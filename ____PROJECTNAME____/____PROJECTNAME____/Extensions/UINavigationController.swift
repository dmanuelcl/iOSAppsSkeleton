//
//  UINavigationController.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 10/2/17.
//  Copyright © ____PROJECTNAME____. All rights reserved.
//

import UIKit

extension UINavigationController{
    
    override open var shouldAutorotate: Bool{
        get{
            return self.topViewController?.shouldAutorotate ?? true
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get{
            return self.topViewController?.supportedInterfaceOrientations ?? .all
        }
    }
}

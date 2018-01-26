//
//  UITableViewCell+ReusableCell.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel Céspedes Lara on 1/25/18.
//  Copyright © 2018 Dani Manuel Céspedes Lara. All rights reserved.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String {get}
}

extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableCell {}

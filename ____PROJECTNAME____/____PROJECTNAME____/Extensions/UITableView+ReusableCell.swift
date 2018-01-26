//
//  UITableView+ReusableCell.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel Céspedes Lara on 1/25/18.
//  Copyright © 2018 Dani Manuel Céspedes Lara. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier,
                                             for: indexPath) as? T else {
                                                fatalError()
        }
        return cell
    }
}

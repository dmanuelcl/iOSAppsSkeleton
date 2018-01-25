//
//  ViewModelBased.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel Céspedes Lara on 1/25/18.
//  Copyright © 2018 Dani Manuel Céspedes Lara. All rights reserved.
//

import UIKit
import Reusable

protocol ViewModelBased: class {
    associatedtype ViewModel

    var viewModel: ViewModel { get set }
}

extension StoryboardBased where Self: UIViewController & ViewModelBased {
    static func instantiate (with viewModel: ViewModel) -> Self {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}

extension StoryboardSceneBased where Self: UIViewController & ViewModelBased{
    static func instantiate (with viewModel: ViewModel) -> Self {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}

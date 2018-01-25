//
//  Double.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 10/2/17.
//  Copyright (c) ____PROJECTNAME____. All rights reserved.
//

import Foundation

extension Double{
    var inMillisecondsFromNow: DispatchTime{
        return DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(1000.0 * self))
    }
}

//
//  Ext+String.swift
//  Tipsy
//
//  Created by Zion Tuiasoa on 12/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

extension String {
    var asDouble: Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

extension String {
    var asInt: Int? {
        return NumberFormatter().number(from: self)?.intValue
    }
}

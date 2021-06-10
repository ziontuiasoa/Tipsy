//
//  TipBrain.swift
//  Tipsy
//
//  Created by Zion Tuiasoa on 12/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

enum TipAmount: Int {
    case zero = 0
    case ten = 10
    case twenty = 20
    
    var asDecimal: Double {
        return self.rawValue.asDecimal
    }
}

class TipBrain {
    
    static func calculateBillTotal(with billAmount: Double, and tipAmount: TipAmount, and splitBillNumber: Int) -> Double {
        
        let tip = billAmount * tipAmount.asDecimal
        let total = billAmount + tip
        let share = total / Double(splitBillNumber)
        
        return share
    }
}



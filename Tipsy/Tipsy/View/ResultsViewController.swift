//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Zion Tuiasoa on 12/3/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalAmount = 0.0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text  = totalAmount.description
    }
    
    @IBAction func recalculateButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

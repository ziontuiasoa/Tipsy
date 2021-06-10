//
//  ViewController.swift
//  Tipsy
//
//  Created by Zion Tuiasoa on 12/3/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitBillStepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    
    var tipValueDictonary: [UIButton: TipAmount] = [:]
    
    var shareAmount = 0.0
    
    //MARK: VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTipData()
        setupUI()
        
        billTextField.delegate = self
    }
    
    //MARK: SETUP
    func setupTipData() {
        tipValueDictonary = [zeroPercentButton: .zero, tenPercentButton: .ten, twentyPercentButton: .twenty]
    }
    
    func setupUI() {
        calculateButton.setBackgroundColor(.lightGray, for: .disabled)
        calculateButton.isEnabled = false
        splitBillStepper.autorepeat = false
        splitBillStepper.maximumValue = 12
    }
    
    //MARK: BUTTONS
    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        
        for button in tipValueDictonary {
            if button.key != sender {
                button.key.isSelected = false
            }
        }
    }
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        var tipAmount: TipAmount = .zero
        for dictionary in tipValueDictonary {
            if dictionary.key.isSelected {
                tipAmount = dictionary.value
            }
        }
        
        guard let billAmount = billTextField.text?.asDouble else {
            billTextField.textColor = .red
            let alert = UIAlertController(title: "YO", message: "Fix that shitty bill", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Fine", style: .default, handler: { _ in
                self.billTextField.becomeFirstResponder()
            })
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard let splitBillNumber = splitNumberLabel.text?.asInt else {
            return
        }
        
        shareAmount = TipBrain.calculateBillTotal(with: billAmount, and: tipAmount, and: splitBillNumber)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //MARK: NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalAmount = shareAmount
        }
    }
}

extension CalculatorViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculateButton.isEnabled = billTextField.hasText
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        billTextField.textColor = .systemGreen
    }
    
    // Removes keyboard when touch outside edit field.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by João Pedro Giarrante on 12/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill: Bill = Bill()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bill.splitNumber = Int(splitNumberLabel.text!)
        bill.tip = 10
        billTextField.delegate = self
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        bill.tip = Int(sender.titleLabel!.text!.dropLast())!
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        bill.splitNumber = Int(sender.value)
    }
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        if(bill.isReadyToCalculate()){
            print(bill.getBillText())
            print(bill.calculateSplitValue())
        }
    
    }
    
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        bill.total = Double(textField.text ?? "0")
    }
}

//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by João Pedro Giarrante on 12/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var bill: Bill = Bill()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bill.splitNumber = Int(splitNumberLabel.text!)
        bill.tip = 10
        billTextField.delegate = self
    }
    
    
    // MARK: - IBActions

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
            performSegue(withIdentifier: SegueIndentifier.calculatorToResults.rawValue, sender: self)
        }
    
    }
    
    
    // MARK: - Delegates
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        bill.total = Double(textField.text ?? "0")
    }
    
    
    // MARK: - Navigation
    
    enum SegueIndentifier: String {
      case calculatorToResults = "calculatorToResults"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identString = segue.identifier, let identifier = SegueIndentifier(rawValue: identString) else {
          super.prepare(for: segue, sender: sender)
          return
        }
        switch identifier {
            case .calculatorToResults:
                let resultsVC = segue.destination as! ResultsViewController
                resultsVC.bill = self.bill
                break
        }
    }
}


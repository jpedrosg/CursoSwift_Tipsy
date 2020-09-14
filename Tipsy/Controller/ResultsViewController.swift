//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by João Pedro Giarrante on 12/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var bill: Bill = Bill()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Populating View
        self.totalLabel.text = String(format: "%.2f", bill.calculateSplitValue())
        self.settingsLabel.text = bill.getBillText()
    }
    
    
    // MARK: - IBActions
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated:true, completion:  nil)
    }

}

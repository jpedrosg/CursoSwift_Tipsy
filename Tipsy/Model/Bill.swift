//
//  Bill.swift
//  Tipsy
//
//  Created by João Pedro Giarrante on 12/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit


class Bill {
    
    var total: Double?
    var splitNumber: Int?
    var tip: Int?
    
    init(total: Double, splitNumber: Int, tip: Int) {
        self.total = total
        self.splitNumber = splitNumber
        self.tip = tip
    }
    
    init(){
        
    }
    
    func getBillText() -> String {
        return "Split between \(self.splitNumber ?? 1) people, with \(self.tip ?? 0)% tip."
    }
    
    
    func isReadyToCalculate() -> Bool {
        return total != nil && splitNumber != nil && tip != nil
    }
    
    func calculateSplitValue() -> Double {
        let tipCalculated = total!*Double(tip!)/100

        return (total! +  tipCalculated) / Double(splitNumber!)
    }
}

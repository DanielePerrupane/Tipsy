//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billtextField: UITextField!
    
    var tip = 0.10

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Deselect all the button
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentageSign = String(buttonTitle.dropLast())
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentageSign)!
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
        
        print(tip)
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
    }
}


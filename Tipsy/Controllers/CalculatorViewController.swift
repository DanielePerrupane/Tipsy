//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.keyboardType = .decimalPad
        billTextField.delegate = self
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        
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
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        
        numberOfPeople = Int(sender.value)
        
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        print(finalResult)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
            
            
        }
    }
    
    //MARK: - TextField Delegate
    
    // Sostituisci la virgola con il punto
    func textField(_ billTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "," {
            billTextField.text = (billTextField.text as NSString?)?.replacingCharacters(in: range, with: ".")
            return false
        }
        return true
    }
    
    
}



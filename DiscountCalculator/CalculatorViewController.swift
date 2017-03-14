//
//  CalculatorViewController.swift
//  MVC-Example
//
//  Created by lis meza on 2/27/17.
//  Copyright © 2017 Horacio Sanchez. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dollarOffLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var otherDiscountLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dollarOffTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var otherDiscountTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var outletButton: UIButton!
    var price = 0.0
    var dollarOff = 0.0
    var discount = 0.0
    var otherDiscount = 0.0
    var tax = 0.0
    var originalPrice = 0.0
    var discountPrice = 0.0
    var saveAmount = 0.0
    var savePercent = 0.0
    var payAmount = 0.0
    var payPercent = 0.0
    
    static let shared:CalculatorViewController = CalculatorViewController()
    
   
 
    
    //MARK: UITextFieldDelegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //This function delegate helps dismiss the keyboard when the user taps 'return' or similar.
        priceTextField.resignFirstResponder()
        dollarOffTextField.resignFirstResponder()
        discountTextField.resignFirstResponder()
        otherDiscountTextField.resignFirstResponder()
        taxTextField.resignFirstResponder()
        
        return true
        
    }
    

    //MARK: Actions
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        //If the "calculate" button is tapped on first when the app launches and the Text Fields are empty, assign zero to the Text Fields so that they can be unwrapped and converted to Doubles in the logic below.
        
        if (priceTextField.text == "") || (dollarOffTextField.text == "") || (discountTextField.text == "") || (otherDiscountTextField.text == "") || (taxTextField.text == ""){
            
           // sender.isEnabled = false

            priceTextField.text = "0.0"
            dollarOffTextField.text = "0.0"
            discountTextField.text = "0.0"
            otherDiscountTextField.text = "0.0"
            dollarOffTextField.text = "0.0"
            taxTextField.text = "0.0"
        }
        
        // Get values frim the text boxes
        price = Double(Float(priceTextField.text!)!)
        dollarOff = Double(Float(dollarOffTextField.text!)!)
        discount = Double(Float(discountTextField.text!)!)
        otherDiscount = Double(Float(otherDiscountTextField.text!)!)
        tax = Double(Float(taxTextField.text!)!)
        
        //Calculate the info
        originalPrice = price + (price*tax)/100
        discountPrice = (1 - (discount + otherDiscount)/100)*price - dollarOff + (tax/100)*price
        

        
        
        
        //Display to the Labels (with Rounding to two decimal places)
        originalPriceLabel.text = "Original Price $\(Double(round(100*originalPrice)/100))"
        discountPriceLabel.text = "Dsicount Price $\(Double(round(100*discountPrice)/100))"
        //discountPriceLabel.text = "Pay Amount $\(Double(round(100*payAmount)/100))"
        
        
        

   }
    
    //MARK: Other Stuff
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make Swipe gestures
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft) //Add gesture to the view
        
        
        // handleSwipe is a function down below...
        // #selector() selects and executes that function
        
        // Handle the textfield user's input through delegate callbacks
        priceTextField.delegate = self
        dollarOffTextField.delegate = self
        discountTextField.delegate = self
        otherDiscountTextField.delegate = self
        taxTextField.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swipe Function
    
    func handleSwipe(_ sender: UISwipeGestureRecognizer){
        
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    
    // Enable Unwinding other views
    
    @IBAction func unwindToCalc(segue: UIStoryboardSegue){
        
    }
    
    
    
    
}


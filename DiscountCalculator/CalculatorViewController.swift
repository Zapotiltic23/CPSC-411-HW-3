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
        
    //MARK: Share

    static let shared:CalculatorViewController = CalculatorViewController()
    
    // 'data' gets me access to variables and methods from the 'Calculator.swift' model
    var data = CalculatorModel.shared
    
    
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
    
    //MARK: Own Functions
    


    //MARK: Actions
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        data.calculus()
        
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


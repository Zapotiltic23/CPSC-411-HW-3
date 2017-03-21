//
// CalculatorViewController.swift
// Project: discountCalculator
// Name: Horacio A Sanchez
// Professor: David McLaren
// Class: CPSc 411 M 7-10pm
// Date: March 20, 2017
//
// Description: 
// This program illustrates the use of segues in swift and creation of graphical bar charts used to display results. The program is in essence a calculator that computes discounts and tax to a given price amount. It then displays the price to pay as well as the amount of money saved in both actual sums of money and percentages. Then the user swipes on the screen to display the bar chart that visually displays the calculations.
//-------------------------------------------------------------------------------------------------------------------------------------------

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
    
    // 'data' gets me access to variables and methods from the 'Calculator.swift' model
    let data = CalculatorModel.shared
    
    
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
    
    //MARK: Other Stuff
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets an image as a background on the app view
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background2")
        self.view.insertSubview(backgroundImage, at: 0)
        
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
        
        firstClick()
        getValues()
        data.calculus()
        displayData()
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    
    // Enable Unwinding other views
    
    @IBAction func unwindToCalc(segue: UIStoryboardSegue){
        
    }
    
    //MARK: Own Functions
    
    private func firstClick(){
        
        //If the "calculate" button is tapped on first when the app launches and the Text Fields are empty, assign zero to the Text Fields so that they can be unwrapped and converted to Doubles in the logic below.
        
        if (priceTextField.text == "") || (dollarOffTextField.text == "") || (discountTextField.text == "") || (otherDiscountTextField.text == "") || (taxTextField.text == ""){
            
            // sender.isEnabled = false
            
            priceTextField.text = "0.0"
            dollarOffTextField.text = "0.0"
            discountTextField.text = "0.0"
            otherDiscountTextField.text = "0.0"
            dollarOffTextField.text = "0.0"
            taxTextField.text = "7.75"
            data.savePercent = Float(0.0)
            data.payPercent = Float(0.0)
        }
    }
    
    private func getValues(){
        
        // Get values from the text boxes
        data.price = Float(priceTextField.text!)!
        data.dollarOff = Float(dollarOffTextField.text!)!
        data.discount = Float(discountTextField.text!)!
        data.otherDiscount = Float(otherDiscountTextField.text!)!
        data.tax = Float(taxTextField.text!)!
    }
    
    private func displayData(){
        
        //Display to the Labels (with Rounding to two decimal places)
        originalPriceLabel.text = "Original Price $\(Float(round(100*data.totalPrice)/100))"
        discountPriceLabel.text = "Discount Price $\(Float(round(100*data.discountPrice)/100))"
        
    }
    
}


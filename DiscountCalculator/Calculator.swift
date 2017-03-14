//
//  Calculator.swift
//  DiscountCalculator
//
//  Created by lis meza on 3/13/17.
//  Copyright © 2017 Horacio Sanchez. All rights reserved.
//

import UIKit

class CalculatorModel {
    
    var price: Float
    var dollarOff: Float
    var discount: Float
    var otherDiscount: Float
    var tax: Float
    var originalPrice: Float
    var discountPrice: Float
    var saveAmount: Float
    var savePercent: Float
    var payAmount: Float
    var payPercent: Float
    
    private init(_ price: Float, _ dollarOff: Float, _ discount: Float, _ otherDiscount: Float, _ tax: Float, _ originalPrice: Float, _ discountPrice: Float, _ saveAmount: Float, _ savePercent: Float, _ payAmount: Float, _ payPercent: Float){
        
        self.price = price
        self.dollarOff = dollarOff
        self.discount = discount
        self.otherDiscount = otherDiscount
        self.tax = tax
        self.originalPrice = originalPrice
        self.discountPrice = discountPrice
        self.saveAmount = saveAmount
        self.savePercent = savePercent
        self.payAmount = payAmount
        self.payPercent = payAmount
    }

    
    static let shared:CalculatorModel = CalculatorModel(0.0, 0.0, 0.0, 0.0, 7.75, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    
    // 'connector' gets me acces to the @IBOutlet variables from UIViewController
    var connector = CalculatorViewController.shared
    
    func calculus(){
        
        
        //If the "calculate" button is tapped on first when the app launches and the Text Fields are empty, assign zero to the Text Fields so that they can be unwrapped and converted to Doubles in the logic below.
        
        if (connector.priceTextField.text == "") || (connector.dollarOffTextField.text == "") || (connector.discountTextField.text == "") || (connector.otherDiscountTextField.text == "") || (connector.taxTextField.text == ""){
            
            // sender.isEnabled = false
            
            connector.priceTextField.text = "0.0"
            connector.dollarOffTextField.text = "0.0"
            connector.discountTextField.text = "0.0"
            connector.otherDiscountTextField.text = "0.0"
            connector.dollarOffTextField.text = "0.0"
            connector.taxTextField.text = "0.0"
        }
        
        // Get values frim the text boxes
        price = Float(connector.priceTextField.text!)!
        dollarOff = Float(connector.dollarOffTextField.text!)!
        discount = Float(connector.discountTextField.text!)!
        otherDiscount = Float(connector.otherDiscountTextField.text!)!
        tax = Float(connector.taxTextField.text!)!
        
        //Calculate the info
        originalPrice = price + (price*tax)/100
        discountPrice = (1 - (discount + otherDiscount)/100)*price - dollarOff + (tax/100)*price
        
        
        //Display to the Labels (with Rounding to two decimal places)
        connector.originalPriceLabel.text = "Original Price $\(Double(round(100*originalPrice)/100))"
        connector.discountPriceLabel.text = "Dsicount Price $\(Double(round(100*discountPrice)/100))"
        //discountPriceLabel.text = "Pay Amount $\(Double(round(100*payAmount)/100))"
        
        
        
    }

}

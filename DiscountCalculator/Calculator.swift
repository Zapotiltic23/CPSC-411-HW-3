//
// Calculator.swift
// Project: DiscountCalculator
// Name: Horacio A Sanchez
// Professor: David McLaren
// Class: CPSc 411 M 7-10pm
// Date: March 20, 2017
//
// Description:
// This program illustrates the use of segues in swift and creation of graphical bar charts used to display results. The program is in essence a calculator that computes discounts and tax to a given price amount. It then displays the price to pay as well as the amount of money saved in both actual sums of money and percentages. Then the user swipes on the screen to display the bar chart that visually displays the calculations.
//-------------------------------------------------------------------------------------------------------------------------------------------

import UIKit

class CalculatorModel {
    
    var price: Float
    var dollarOff: Float
    var discount: Float
    var otherDiscount: Float
    var tax: Float
    var originalPrice: Float
    var totalPrice: Float
    var saveAmount: Float
    var savePercent: Float
    var payPercent: Float
    var discountPrice: Float
    
    //Contructor
    private init(_ price: Float, _ dollarOff: Float, _ discount: Float, _ otherDiscount: Float, _ tax: Float, _ originalPrice: Float, _ discountPrice: Float, _ saveAmount: Float, _ savePercent: Float, _ payPercent: Float){
        
        self.price = price
        self.dollarOff = dollarOff
        self.discount = discount
        self.otherDiscount = otherDiscount
        self.tax = tax
        self.originalPrice = originalPrice
        self.totalPrice = discountPrice
        self.saveAmount = saveAmount
        self.savePercent = savePercent
        self.payPercent = payPercent
        self.discountPrice = discountPrice
    }

    
    static let shared:CalculatorModel = CalculatorModel(0.0, 0.0, 0.0, 0.0, 7.75, 0.0, 0.0, 0.0, 0.0, 0.0)
    
    func calculus(){
        
        //Calculate the info
        totalPrice = price + (price*tax)/100
        discountPrice = (1 - (discount + otherDiscount)/100)*price - dollarOff + (tax/100)*price
        saveAmount = totalPrice - discountPrice
        savePercent = (saveAmount/totalPrice)*100
        payPercent = 100 - savePercent
        
        //Don't allow a person to get money back from purchasing
        if discountPrice < 0.0{
            
            discountPrice = totalPrice
        }
        
        if (savePercent > 100.0){
            
            savePercent = Float(100.0)
            saveAmount = totalPrice
        }
        
        if payPercent < 0{
            
            payPercent = Float(0.0)
            discountPrice = Float(0.0)
            
        }
    }
}

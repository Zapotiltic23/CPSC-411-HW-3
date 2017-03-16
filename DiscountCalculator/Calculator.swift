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
    var totalPrice: Float
    var saveAmount: Float
    var savePercent: Float
    //var payAmount: Float
    var payPercent: Float
    var discountPrice: Float
    
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
        //self.payAmount = payAmount
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
    }

}

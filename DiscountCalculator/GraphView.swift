//
// GraphView.swift
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

extension CGContext{
    // By having the underscore, you dont have to specify the hex
    func setFillColor(_ hex:Int){
        //Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF)/255.0
        
        setFillColor(red:redColor, green:greenColor, blue:blueColor, alpha:1.0)
    }
}


class GraphView: UIView {
    
    let data = CalculatorModel.shared
    
     override func draw(_ rect: CGRect){
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let totalRecHeight = screenHeight - 180.0
        let verticalSpacing: CGFloat = 16
        let horizontalSpacing: CGFloat = 16
        
        let leftGuide:CGFloat = 16.0
        let topGuide:CGFloat = 64.0 + leftGuide
        
        //Text Attributes
        let textAttributes = [NSFontAttributeName: UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 14.0)!, NSForegroundColorAttributeName: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)]
        
        // ----------------------------Draw Price Rectangle------------------------------
        
        //Get this hex values from AdobeColor.com
        context.setFillColor(0x84516D)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:(screenWidth)/2 - 16, height:totalRecHeight))
    
        //Draw Price Text & Legend
        context.setFillColor(0x84516D)
        context.fill(CGRect(x:leftGuide, y:totalRecHeight + verticalSpacing*6, width:10, height:10))
        
        let priceText = "Original Price"
        let priceAmount = "$\(Float(data.totalPrice))"
        
        let priceTextCoord = CGPoint(x:leftGuide + horizontalSpacing, y:totalRecHeight + verticalSpacing*6)
        let priceAmountCoord = CGPoint(x:leftGuide + 16.0, y:totalRecHeight + verticalSpacing*7)
        
        priceText.draw(at: priceTextCoord, withAttributes: textAttributes)
        priceAmount.draw(at: priceAmountCoord, withAttributes: textAttributes)
        // -------------------------------------------------------------------------------
        // ----------------------------Draw Save Rectangle--------------------------------
        
        let rightCorner = (screenWidth)/2
        let savePercentHeight = (data.savePercent/100)*Float(totalRecHeight)
        context.setFillColor(0x5DC896)
        context.fill(CGRect(x:rightCorner, y:topGuide, width:(screenWidth)/2 - 16, height: CGFloat(savePercentHeight)))
        
        //Draw Price Text & Legend
        context.setFillColor(0x5DC896)
        context.fill(CGRect(x:leftGuide + horizontalSpacing*8, y:totalRecHeight + verticalSpacing*6, width:10, height:10))
        
        let saveText = "You Saved"
        let saveAmount = "$\(Float(data.saveAmount))"
        let savePercent = "\(Float(data.savePercent))%"
        
        let saveTextCoord = CGPoint(x: leftGuide + horizontalSpacing*9, y: totalRecHeight + verticalSpacing*6)
        let saveAmountCoord = CGPoint(x: leftGuide + horizontalSpacing*9, y: totalRecHeight + verticalSpacing*7)
        let savePercentCoord = CGPoint(x: leftGuide + horizontalSpacing*9, y: totalRecHeight + verticalSpacing*8)
        
        saveText.draw(at: saveTextCoord, withAttributes: textAttributes)
        saveAmount.draw(at: saveAmountCoord, withAttributes: textAttributes)
        savePercent.draw(at: savePercentCoord, withAttributes: textAttributes)
        // -------------------------------------------------------------------------------
        // ----------------------------Draw Pay Rectangle---------------------------------
        
        let payPercentHeight = Float(totalRecHeight) - savePercentHeight
        context.setFillColor(0xE6643B)
        context.fill(CGRect(x: rightCorner, y: CGFloat(savePercentHeight) + 96 - 16, width: (screenWidth)/2 - 16, height: CGFloat(payPercentHeight)))
        
        // Draw Pay Text & Legend
        context.setFillColor(0xE6643B)
        context.fill(CGRect(x:leftGuide + horizontalSpacing*16, y:totalRecHeight + verticalSpacing*6, width:10, height:10))
        
        let payText = "You Pay"
        let payAmount = "$\(Float(data.totalPrice - data.saveAmount))"
        let payPercent = "\(Float(data.payPercent))%"
        
        let payTextCoord = CGPoint(x: leftGuide + horizontalSpacing*17, y: totalRecHeight + verticalSpacing*6)
        let payAmountCoord = CGPoint(x: leftGuide + horizontalSpacing*17, y: totalRecHeight + verticalSpacing*7)
        let payPercentCoord = CGPoint(x: leftGuide + horizontalSpacing*17, y: totalRecHeight + verticalSpacing*8)
        
        payText.draw(at: payTextCoord, withAttributes: textAttributes)
        payAmount.draw(at: payAmountCoord, withAttributes: textAttributes)
        payPercent.draw(at: payPercentCoord, withAttributes: textAttributes)
    }
}

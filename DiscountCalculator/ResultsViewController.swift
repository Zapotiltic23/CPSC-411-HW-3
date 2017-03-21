//
// ResultsViewController.swift
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

class ResultsViewController: UIViewController {
    
    //Define singleton inside of a function!!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Handles swipe back to CalculatorView
    func handleSwipe(_ sender: UISwipeGestureRecognizer){
        
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
    }
    
    
}


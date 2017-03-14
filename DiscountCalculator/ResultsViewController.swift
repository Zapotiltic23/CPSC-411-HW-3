//
//  ResultsViewController.swift
//  MVC-Example
//
//  Created by lis meza on 2/27/17.
//  Copyright © 2017 Horacio Sanchez. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //Define singleton inside of a function!!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipe(_ sender: UISwipeGestureRecognizer){
        
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
    }
    
    
}


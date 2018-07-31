//
//  ViewController.swift
//  CALCULATOR
//
//  Created by Mehrab Hasan on 6/26/18.
//  Copyright © 2018 Mehrab Hasan. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    
    
    var numberOndisplay:Double = 0;
    var previousNumber:Double = 0;
    var MathOperation = false
    var result: Double = 0
    var currentOperation:Operation = .NULL
    
    
    
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = ""
        
    }
    
    @IBAction func Numbers(_ sender: Any) {
        
        
        if MathOperation == true
        {
            display.text = String((sender as AnyObject).tag)
            numberOndisplay = Double(display.text!)!
            //currentNumber = "\(String(describing: display.text))"
            MathOperation = false
        }
        else
        {
            display.text = display.text! + String((sender as AnyObject).tag)
            numberOndisplay = Double(display.text!)!
            
        }
    }
    
    @IBAction func AddButton(_ sender: Any) {
        MathOperation = true;
        
        operation(operation: .Add)
    }
    
    
    @IBAction func SubtractButton(_ sender: Any) {
        MathOperation = true;
        
       
        operation(operation: .Subtract)
    }
    
    @IBAction func MultiplyButton(_ sender: Any) {
        MathOperation = true;
        
       
        operation(operation: .Multiply)
    }
    
    @IBAction func DevisionButton(_ sender: Any) {
        MathOperation = true;
        
        
        operation(operation: .Divide)
    }
    
    @IBAction func ResultButton(_ sender: Any) {
        operation(operation: currentOperation)
    }
    

    
    @IBAction func ClearButton(_ sender: Any) {
        
        previousNumber = 0
        result = 0
        currentOperation = .NULL
        display.text = ""
        numberOndisplay = 0;
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if "\(numberOndisplay)".count  != 0 {
                
                
                if currentOperation == .Add {
                    result = previousNumber + numberOndisplay
                    display.text = String(result)
                    
                }
                else if currentOperation == .Subtract {
                    result = previousNumber - numberOndisplay
                    display.text = String(result)
                }
                else if currentOperation == .Multiply {
                    result = previousNumber * numberOndisplay
                    display.text = String(result)
                    
                }
                else if currentOperation == .Divide {
                    result = previousNumber / numberOndisplay
                    display.text = String(result)
                }
                
            }
            currentOperation = operation
            previousNumber = result
            
        }
        
        else {
            previousNumber = numberOndisplay
            numberOndisplay = 0
            currentOperation = operation
        }
    
}

}

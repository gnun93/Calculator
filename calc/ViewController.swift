//
//  ViewController.swift
//  calc
//
//  Created by 장진원 on 2020/09/14.
//  Copyright © 2020 Jin won Jang. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    var isSymbolPressed: Bool = false
    var newOperation = true
    var op = ""
    var number1: NSNumber? = nil
    
    func AddNumberToInput(number: String) {
        var textNumber = String(labelNumberShow.text!)
        
        if newOperation {
            textNumber = ""
            newOperation = false
        }
        textNumber = textNumber + number
        labelNumberShow.text = textNumber
    }
    
    @IBAction func btnMultiply(_ sender: Any) {    // *
        
        calculate()
        op = "*"
        
        number1 = NSNumber(value: Double(labelNumberShow.text!)!)
        newOperation = true
    }
    @IBAction func btnDivide(_ sender: Any) {     // /
        calculate()
        
        op = "÷"
        
        number1 = NSNumber(value: Double(labelNumberShow.text!)!)
        newOperation = true
        
    }
    @IBAction func btnPlus(_ sender: Any) {    // +
        
        calculate()
        
        op = "+"
        
        number1 = NSNumber(value: Double(labelNumberShow.text!)!)
        newOperation = true
        
    }
    @IBAction func btnMinus(_ sender: Any) {    // -
        
        calculate()
        
        op = "-"
        
        number1 = NSNumber(value: Double(labelNumberShow.text!)!)
        newOperation = true
        
    }
    
    @IBAction func btnDot(_ sender: Any) {   // 소수점
        
        let buttonText:String? = "."
        let labelText = labelNumberShow.text!
        if labelText.contains(".") {
            return
        }
        labelNumberShow.text =
            "\((Double(labelText) != 0.0 || labelText.contains(".") || buttonText == ".") ? labelText : "")" +
        "\(buttonText!)"
    }
    
    
    
    @IBAction func btnClear(_ sender: Any) {     // 클리어
        labelNumberShow.text = "0"
        newOperation = true
        number1 = nil;
    }
    
    @IBAction func btnPercent(_ sender: Any) {
        var doubleNumber = Double(labelNumberShow.text!)
        
        doubleNumber = doubleNumber!/Double(100.0)
        labelNumberShow.text = String(doubleNumber!)
        newOperation = true
    }
    
    
    @IBAction func btnPlusMinus(_ sender: Any) {   // + -
        let number1 = Double(labelNumberShow.text!)
        var remove: Double?
        
        remove = number1! * -1.0
        labelNumberShow.text = String(remove!)
        newOperation = true
    }
    
    
    
    
    func calculate () {
        
        if (number1 != nil) {
            btnEqual(UIButton())
            number1 = nil
        }
        
        number1 = NSNumber(value: Double(labelNumberShow.text!)!)
    }
    
    @IBAction func btnEqual(_ sender: UIButton) {
        let number2 = Double(labelNumberShow.text!)
        var results: Double?
        
        switch op {
        case "*":
            results = number1! as! Double * number2!
        case "÷":
            results = number1! as! Double / number2!
        case "-":
            results = number1! as! Double - number2!
        case "+":
            results = number1! as! Double + number2!
            
        default:
            results = 0
        }
        
        labelNumberShow.text = String(results!)
        newOperation = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var labelNumberShow: UILabel!
    @IBAction func btn0(_ sender: Any) {
        AddNumberToInput(number: "0")
    }
    @IBAction func btn1(_ sender: Any) {
        AddNumberToInput(number: "1")
    }
    @IBAction func btn2(_ sender: Any) {
        AddNumberToInput(number: "2")
    }
    @IBAction func btn3(_ sender: Any) {
        AddNumberToInput(number: "3")
    }
    @IBAction func btn4(_ sender: Any) {
        AddNumberToInput(number: "4")
    }
    @IBAction func btn5(_ sender: Any) {
        AddNumberToInput(number: "5")
    }
    @IBAction func btn6(_ sender: Any) {
        AddNumberToInput(number: "6")
    }
    @IBAction func btn7(_ sender: Any) {
        AddNumberToInput(number: "7")
    }
    @IBAction func btn8(_ sender: Any) {
        AddNumberToInput(number: "8")
    }
    @IBAction func btn9(_ sender: Any) {
        AddNumberToInput(number: "9")
    }
}

//
//  ViewController.swift
//  tippy
//
//  Created by natthakorn pattanapongsak on 8/15/17.
//  Copyright © 2017 natthakorn pattanapongsak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var eachPay: UILabel!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var numPeople: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        defaults.set(18, forKey: "option1Value")
        defaults.set(20, forKey: "option2Value")
        defaults.set(25, forKey: "option3Value")
        
        defaults.set(1, forKey: "numPeople")
    
        defaults.set("18%", forKey: "option1Name")
        defaults.set("20%",forKey: "option2Name")
        defaults.set("25%",forKey: "option3Name")
        
        numPeople.text = String(defaults.integer(forKey: "numPeople"))
        
        tipControl.setTitle(defaults.string(forKey: "option1Name"), forSegmentAt: 0)
        tipControl.setTitle(defaults.string(forKey: "option2Name"), forSegmentAt: 1)
        tipControl.setTitle(defaults.string(forKey: "option3Name"), forSegmentAt: 2)
        print("View Did Load")
        
        billField.becomeFirstResponder()
        eachPay.text = String(format: "%@%@",currencySymbol,"0.00")
        tipLabel.text = String(format: "%@%@", currencySymbol,"0.00")
        totalLabel.text = String(format: "%@%@", currencySymbol,"0.00")
       
    }
    
    

    
    func calculateTip(){
        let defaults = UserDefaults.standard
        let option1Value = defaults.integer(forKey: "option1Value")
        let option2Value = defaults.integer(forKey: "option2Value")
        let option3Value = defaults.integer(forKey: "option3Value")
        
        let tipPercentages = [Double(option1Value)/Double(100),Double(option2Value)/Double(100),Double(option3Value)/Double(100)]
        let bill = Double(billField.text!) ?? 0
        print(tipPercentages[tipControl.selectedSegmentIndex])
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        // tipControl.segme
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!

        
        eachPay.text = String(format: "%@%.2f",currencySymbol,Double(total)/Double(defaults.integer(forKey: "numPeople")))
        tipLabel.text = String(format: "%@%.2f", currencySymbol,tip)
        totalLabel.text = String(format: "%@%.2f", currencySymbol,total)
        
        
        print(currencySymbol);

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        print(defaults.string(forKey: "option1Value") ?? "ss")
        tipControl.setTitle(defaults.string(forKey: "option1Value")!+"%", forSegmentAt: 0)
        tipControl.setTitle(defaults.string(forKey: "option2Value")!+"%", forSegmentAt: 1)
        tipControl.setTitle(defaults.string(forKey: "option3Value")!+"%", forSegmentAt: 2)
        numPeople.text = String(defaults.integer(forKey: "numPeople"))
        
        
        calculateTip()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        calculateTip()
    }
}


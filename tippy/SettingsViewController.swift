//
//  SettingsViewController.swift
//  tippy
//
//  Created by natthakorn pattanapongsak on 8/17/17.
//  Copyright © 2017 natthakorn pattanapongsak. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var option1Value: UITextField!
    @IBOutlet weak var option2Value: UITextField!
    @IBOutlet weak var option3Value: UITextField!
    @IBOutlet weak var numPeople: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        option1Value.text = String(defaults.integer(forKey: "option1Value"))
        option2Value.text = String(defaults.integer(forKey: "option2Value"))
        option3Value.text = String(defaults.integer(forKey: "option3Value"))
        numPeople.text = String(defaults.integer(forKey: "numPeople"))
    }
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let defaults = UserDefaults.standard
        
        defaults.set(Int(option1Value.text!), forKey: "option1Value")
        defaults.set(Int(option2Value.text!), forKey: "option2Value")
        defaults.set(Int(option3Value.text!), forKey: "option3Value")
        
        defaults.set(Int(numPeople.text!), forKey: "numPeople")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

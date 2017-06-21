//
//  ViewController.swift
//  Tippy
//
//  Created by Mei-Ling Laures on 6/20/17.
//  Copyright © 2017 Mei-Ling Laures. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* Outlets which must be changed through the functions */
    @IBOutlet weak var bill_entry: UITextField!
    @IBOutlet weak var total_label: UILabel!
    @IBOutlet weak var tip_label: UILabel!
    @IBOutlet weak var tip_control: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* function: To calculate the tip
     * param: N/A
     * returns: N/A
     * This function directly uses connected outlets in order to change the text values that they have.
     */
    @IBAction func calculate_tip(_ sender: Any) {
        
        let defaults = UserDefaults.standard;
        
        // make an array of percentages which user has set as default
        let percentages = [defaults.double(forKey: "seg_op1"), defaults.double(forKey: "seg_op2"), defaults.double(forKey: "seg_op3")];
        // store the input that is in the text entry field
        let amount = Double(bill_entry.text!) ?? 0;
        
        // do the calculation for the tip
        let calc = amount * percentages[tip_control.selectedSegmentIndex];
        
        // update the displays for the tip and the total
        tip_label.text = String(format: "$%.2f", calc);
        total_label.text = String(format: "$%.2f", (calc+amount));
        
        
        
    }

    // function: To put away the keyboard
    @IBAction func on_tap(_ sender: Any) {
        view.endEditing(true);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // recalculate the tip whenever this screen appears
        self.calculate_tip(self);
        
        // make sure the tip options are up-to-date from the global variables
        let defaults = UserDefaults.standard;
        tip_control.setTitle(defaults.string(forKey: "seg_op1")! + "%", forSegmentAt: 0);
        tip_control.setTitle(defaults.string(forKey: "seg_op2")! + "%", forSegmentAt: 1);
        tip_control.setTitle(defaults.string(forKey: "seg_op3")! + "%", forSegmentAt: 2);

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

}


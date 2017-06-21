//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Mei-Ling Laures on 6/20/17.
//  Copyright © 2017 Mei-Ling Laures. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // Outlets that must be referenced from the settings screen
    @IBOutlet weak var seg1: UITextField!
    @IBOutlet weak var seg2: UITextField!
    @IBOutlet weak var seg3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* function: To change the preferred tip percentages
     * param: N/A
     * returns: N/A
     * This function will take whatever the user inputs in the three options for percentages and store the value within the global variables for later
     */
    @IBAction func segment_change(_ sender: UITextField) {
        // check if the inputs are valid numbers
        let per1 = Double(seg1.text!) ?? 0;
        let per2 = Double(seg2.text!) ?? 0;
        let per3 = Double(seg3.text!) ?? 0;
        
        // set the global variables to be accessed later
        let defaults = UserDefaults.standard;
        defaults.set(per1, forKey: "seg_op1");
        defaults.set(per2, forKey: "seg_op2");
        defaults.set(per3, forKey: "seg_op3");
        defaults.synchronize();
        
        // reset the text of the segments to properly display what has been stored
        seg1.text = defaults.string(forKey: "seg_op1");
        seg2.text = defaults.string(forKey: "seg_op2");
        seg3.text = defaults.string(forKey: "seg_op3");
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make sure the displayed changeable tip percentages are what are actually stored in the global variables
        let defaults = UserDefaults.standard;
        seg1.text = defaults.string(forKey: "seg_op1");
        seg2.text = defaults.string(forKey: "seg_op2");
        seg3.text = defaults.string(forKey: "seg_op3");
        
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

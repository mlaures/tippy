//
//  ViewController.swift
//  Tippy
//
//  Created by Mei-Ling Laures on 6/20/17.
//  Copyright © 2017 Mei-Ling Laures. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    @IBAction func calculate_tip(_ sender: Any) {
        
        let percentages = [0.15, 0.18, 0.2];
        let amount = Double(bill_entry.text!) ?? 0;
        
        let calc = amount * percentages[tip_control.selectedSegmentIndex];
        
        
        tip_label.text = String(format: "$%.2f", calc);
        total_label.text = String(format: "$%.2f", (calc+amount));
    }

    @IBAction func on_tap(_ sender: Any) {
        view.endEditing(true);
    }
}


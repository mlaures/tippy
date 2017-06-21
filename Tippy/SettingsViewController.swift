//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Mei-Ling Laures on 6/20/17.
//  Copyright © 2017 Mei-Ling Laures. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

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
    
    @IBAction func segment_change(_ sender: UITextField) {
        let per1 = Double(seg1.text!) ?? 0;
        let per2 = Double(seg2.text!) ?? 0;
        let per3 = Double(seg3.text!) ?? 0;
        
        let defaults = UserDefaults.standard;
        defaults.set(per1, forKey: "seg_op1");
        defaults.set(per2, forKey: "seg_op2");
        defaults.set(per3, forKey: "seg_op3");
        defaults.synchronize();
        
        seg1.text = String(defaults.integer(forKey: "seg_op1"));
        seg2.text = String(defaults.integer(forKey: "seg_op2"));
        seg3.text = String(defaults.integer(forKey: "seg_op3"));
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard;
        
        seg1.text = String(defaults.integer(forKey: "seg_op1"));
        seg2.text = String(defaults.integer(forKey: "seg_op2"));
        seg3.text = String(defaults.integer(forKey: "seg_op3"));
        
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

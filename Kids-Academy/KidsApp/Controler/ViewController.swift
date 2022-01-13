//
//  ViewController.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var page1: UIView!
    @IBOutlet weak var page2: UIView!

    @IBAction func Segmented(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            page1.alpha = 0
            page2.alpha = 1
        }else{
            page1.alpha = 1
            page2.alpha = 0
        }
        
        
    }
    
}


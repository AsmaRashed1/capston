//
//  HomePage.swift
//  KidsApp
//
//  Created by Asma Rasheed on 23/12/2021.
//

import UIKit
import FirebaseAuth

class HomePage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
            if user == nil {
                self.performSegue(withIdentifier: "Auth", sender: nil)
                // no user
            } else {
                print("Eroor")
            }
            
        }
        
    }
    
}

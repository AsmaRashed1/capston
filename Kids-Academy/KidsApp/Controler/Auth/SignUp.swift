//
//  SignUp.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import FirebaseAuth

class SignUp: UIViewController {

    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ConfirmPasswordT: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func SignUpAction(_ sender: Any) {
        if ConfirmPasswordT.text != password.text {
            // the password is not matching the confirm password
            return
        }
        
        Auth.auth().createUser(withEmail: emailAddress.text!, password: password.text!) { (auth, error) in
            
            if error == nil {
                          print("Done Signing up.")
                self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                      } else {
                          print(error.debugDescription)
                      }
        }
        
        if emailAddress.text?.isEmpty ?? true || password.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "please Enter Email", message: "your email is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            self.present(alert, animated : true)
        }
        else {

            let alert = UIAlertController(title: "Welcome To Store", message: "Complete Registration", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
    self.present(alert, animated : true)
        }
    
    }
    }
    

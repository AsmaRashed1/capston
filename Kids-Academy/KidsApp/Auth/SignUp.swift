//
//  SignUp.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import FirebaseAuth

class SignUp: UIViewController {

    
    @IBOutlet weak var EmailT: UITextField!
    @IBOutlet weak var PasswordT: UITextField!
    @IBOutlet weak var ConfirmPasswordT: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func SignUpAction(_ sender: Any) {
        if ConfirmPasswordT.text != PasswordT.text {
            // the password is not matching the confirm password
            return
        }
        
        Auth.auth().createUser(withEmail: EmailT.text!, password: PasswordT.text!) { (auth, error) in
            
            if error == nil {
                          print("Done Signing up.")
                self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                      } else {
                          print(error.debugDescription)
                      }
        }
    }
    
}

//
//  SignIn.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import FirebaseAuth

class SignIn: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBagroundTap()
    }
   
    @IBAction func SignInButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: self.EmailTextField.text!, password: self.PasswordTextField.text!) { (auth, error) in
            
            if error == nil {
                print("Done signing in.")
                self.dismiss(animated: true, completion: nil)
            } else {
                print(error.debugDescription)
            }
        }
        
    }
    private func setupBagroundTap(){
        let tapGesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
      }
      @objc func hideKeyboard (){
        view.endEditing(false)
      }
}

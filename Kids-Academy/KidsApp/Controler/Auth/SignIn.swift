//
//  SignIn.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import FirebaseAuth
import TextFieldEffects

class SignIn: UIViewController {
    
    //MARK:- outlet

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBagroundTap()
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (auth, error) in
            
            if error == nil {
                print("Done signing in.")
                self.dismiss(animated: true, completion: nil)
            } else {
                print(error.debugDescription)
            }
        }
        
    }
    
    //MARK:- Gesture Recognizer

    private func setupBagroundTap(){
        let tapGesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard (){
        view.endEditing(false)
    }
}

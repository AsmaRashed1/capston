//
//  ZAdminViewController.swift
//  KidsApp
//
//  Created by Asma Rasheed on 09/06/1443 AH.
//

import UIKit

class ZAdminViewController: UIViewController {
    
    
    
    @IBOutlet weak var UsetX: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func btnAdmine(_ sender: Any) {
        
        
        let UsetX = UsetX.text
        let USName = "1234"
        if (UsetX == USName){
            performSegue(withIdentifier: "admin", sender: self)
        }else{
            Messeage()
        }
        
    }
    
    func Messeage(){
        let alert = UIAlertController(title: "OK", message: "Make sure the password is correct", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

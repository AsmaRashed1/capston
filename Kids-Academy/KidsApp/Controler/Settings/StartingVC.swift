//
//  StartingVC.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import FirebaseAuth


class StartingVC: UIViewController {
    
    
    
    @IBAction func darckMode(_ sender: UISwitch) {
        
        
        
        if #available (iOS 13.0, *) {
            
            let appDelegate = UIApplication.shared.windows.first
            
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
        }
        else {
            print ("error")
        }
    }
    
    @IBAction func SignOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion: nil)
        }
        catch let signOutError as NSError {
            print ("Error signin out : %@" , signOutError)
        }
    }
    //        try? Auth.auth().signOut()
    //        dismiss(animated: true, completion: nil)
    //    }
    
    
    @IBAction func Language(_ sender: Any) {
        let alert = UIAlertController(title: "You can change your language by going to your device settings." , message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        let settings = UIAlertAction(title: "See Settings", style: .default, handler: { (action) -> Void in
            UIApplication.shared.open(URL(string: "App-Prefs:root=GENERAL")!, options: [:], completionHandler: nil)
        })
        alert.addAction(settings)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

    
}

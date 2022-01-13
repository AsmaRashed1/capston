//
//  AddNewProductVC.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import FirebaseStorage
import Kingfisher

class AddNewProductVC: UIViewController {
    

    @IBOutlet weak var Des: UITextField!
    
    @IBOutlet weak var lableDone: UILabel!
    
    @IBOutlet weak var imageUpload: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func UploadData(_ sender: Any) {
    
        lableDone.text = "Done Upload"
        
        let GenerateID = UUID().uuidString
        let newProduct = ProductObject(ID: GenerateID, Stamp: Date().timeIntervalSince1970,Des: self.Des.text!, image: "https://firebasestorage.googleapis.com/v0/b/kidsapp-66bbc.appspot.com/o/Cow.png?alt=media&token=9d8cfafb-b7f9-4cf9-baee-6b905b3315cf")
        
        newProduct.Upload()
        
//        uploadImage(image: 1b5e29da-e224-4f47-80bc-0ab2fe09965e)
        
        
    }
    
    @IBAction func uploadImg(_ sender: Any) {
       
  
}
    
    func uploadImage(image:UIImage) {
        
        let ref = Storage.storage().reference().child("colors")
        guard let dataimage = image.pngData() else {return}
        let meta = StorageMetadata()
        meta.contentType = "images/png"
        
        ref.putData(dataimage, metadata: meta) { imageUploaded, error in
            if let error = error {
                print(error)
            } else {
                DispatchQueue.main.async {
                    
                    ref.downloadURL { url, error in
                        if error != nil {
                            print("error")
                        } else {
                            // url save in database
                            let GenerateID = UUID().uuidString
                            let newProduct = ProductObject(ID: GenerateID, Stamp: Date().timeIntervalSince1970,Des: self.Des.text!, image: url!.absoluteString)
                            newProduct.Upload()
                        }
                    }
                }
            }
        }
        
        
    }

}


//
//  ProductObject.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import Foundation
import FirebaseFirestore

class ProductObject {
    
    var ID : String?
    var Stamp : TimeInterval?
    var Des : String?
    var image : String?
    
    
    init(ID : String, Stamp : TimeInterval, Des : String,image:String) {
        self.ID = ID
        self.Stamp = Stamp
        self.Des = Des
        self.image = image
    }
    
    init(Dictionary : [String : AnyObject]) {
        self.ID = Dictionary["ID"] as? String
        self.Stamp = Dictionary["Stamp"] as? TimeInterval
        self.Des = Dictionary["Des"] as? String
        self.image = Dictionary["Image"] as? String
        
    }
    
    func MakeDictionary()->[String : AnyObject] {
        var D : [String : AnyObject] = [:]
        D["ID"] = self.ID as AnyObject
        D["Stamp"] = self.Stamp as AnyObject
        D["Des"] = self.Des as AnyObject
        D["Image"] = self.image as AnyObject
        return D
    }
    
    func Upload(){
        guard let id = self.ID else { return }
        Firestore.firestore().collection("Products").document(id).setData(MakeDictionary())
    }
    
    func Remove(){
        guard let id = self.ID else { return }
        Firestore.firestore().collection("Products").document(id).delete()
    }
    
    
}


class ProductApi {

    static func GetProduct(ID : String, completion : @escaping (_ Product : ProductObject)->()){
        Firestore.firestore().collection("Products").document(ID).addSnapshotListener { (Snapshot : DocumentSnapshot?, Error : Error?) in
            if let data = Snapshot?.data() as [String : AnyObject]? {
                let New = ProductObject(Dictionary: data)
                completion(New)
            }
        }
    }
    
    static func GetAllProducts(completion : @escaping (_ Product : ProductObject)->()){
        Firestore.firestore().collection("Products").getDocuments { (Snapshot, error) in
            if error != nil { print("Error") ; return }
            guard let documents = Snapshot?.documents else { return }
            for P in documents {
                if let data = P.data() as [String : AnyObject]? {
                    let New = ProductObject(Dictionary: data)
                    completion(New)
                }
            }
        }

    }
    
}



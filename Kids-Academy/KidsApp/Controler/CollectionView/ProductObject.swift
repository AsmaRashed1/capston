//
//  ProductObject.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import Foundation
import FirebaseFirestore

class ProductObject {
    
    var id : String?
    var stamp : TimeInterval?
    var des : String?
    var image : String?
    
    
    init(ID : String, Stamp : TimeInterval, Des : String,image:String) {
        self.id = ID
        self.stamp = Stamp
        self.des = Des
        self.image = image
    }
    
    init(Dictionary : [String : AnyObject]) {
        self.id = Dictionary["ID"] as? String
        self.stamp = Dictionary["Stamp"] as? TimeInterval
        self.des = Dictionary["Des"] as? String
        self.image = Dictionary["Image"] as? String
        
    }
    
    func MakeDictionary()->[String : AnyObject] {
        var data : [String : AnyObject] = [:]
        data["ID"] = self.id as AnyObject
        data["Stamp"] = self.stamp as AnyObject
        data["Des"] = self.des as AnyObject
        data["Image"] = self.image as AnyObject
        return data
    }
    
    func Upload(){
        guard let id = self.id else { return }
        Firestore.firestore().collection("Products").document(id).setData(MakeDictionary())
    }
    
    func Remove(){
        guard let id = self.id else { return }
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



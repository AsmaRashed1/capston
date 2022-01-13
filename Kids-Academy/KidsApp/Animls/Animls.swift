//
//  Animls.swift
//  KidsApp
//
//  Created by Asma Rasheed on 23/12/2021.
//

import UIKit

class Animls: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var AinmlsCollection: UICollectionView!
    
    
    var img = [UIImage(named: "Dog"),UIImage(named: "Cow"),UIImage(named: "xantus"),UIImage(named: "toucan"),UIImage(named: "kangaroo")]
    
    var name = ["Dog","Cow","Xantus","toucan","kangaroo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AinmlsCollection.delegate = self
        AinmlsCollection.dataSource = self
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellx", for: indexPath) as! AnimlsCell
        
        cell.img.image = img[indexPath.row]
        cell.name.text = name[indexPath.row]
        
        
        return cell
    }
    
   

}

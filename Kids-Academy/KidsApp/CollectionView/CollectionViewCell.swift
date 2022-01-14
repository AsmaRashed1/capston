//
//  CollectionViewCell.swift
//  KidsApp
//
//  Created by Asma Rasheed on 16/12/2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Des: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    func Update(Product : ProductObject) {
        self.Des.text = Product.Des
        
        guard let downloadURL = URL(string:Product.image ?? "") else {return}
        
        let resourse = ImageResource(downloadURL :downloadURL )
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        imgView.kf.setImage(
            with: downloadURL,
//            placeholder: UIImage(named: "logo"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
    }
    
}

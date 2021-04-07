//
//  CollectionViewCell.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 06/04/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    
    func configureView(name: String) {
        if let preImage = UIImage(named: name)  {
            image?.image = preImage
        }else {
            image?.image = UIImage(named:"testImage0")
        }
    }
}

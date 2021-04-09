//
//  SearchCollectionViewCell.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 08/04/2021.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    func configureView(name: String){
        if let preImage = UIImage(named: name){
            image?.image = preImage
        }else {
            image?.image = UIImage(named: "testImage1")
        }
    }
    
}

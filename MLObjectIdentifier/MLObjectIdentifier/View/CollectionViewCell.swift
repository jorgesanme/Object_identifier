//
//  CollectionViewCell.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 06/04/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var image: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // eliminar el contenido de la celda antes de reusar
         
    }
    
  
    func configureView(name: String) -> (UIImage){
        //image?.image = UIImage(named: name)
        guard let image = UIImage(named: name) else {
            return   UIImage(named: "testImage1")!
        }
        return image
    }
}

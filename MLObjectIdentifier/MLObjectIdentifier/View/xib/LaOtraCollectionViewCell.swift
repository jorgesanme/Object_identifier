//
//  LaOtraCollectionViewCell.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 09/04/2021.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureView(name: String){
        if let preImage = UIImage(named: name){
            imageView?.image = preImage
        }else {
            imageView.image = UIImage(named: "testImage1")
        }
    }

}

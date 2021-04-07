//
//  ViewController.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 06/04/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "main"
        
        imageTest.image = UIImage(systemName: "person")
    }

    

}


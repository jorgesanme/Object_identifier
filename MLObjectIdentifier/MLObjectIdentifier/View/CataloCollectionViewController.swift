//
//  CataloCollectionViewController.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 06/04/2021.
//

import UIKit

private let reuseIdentifier = "SearchCollectionViewCell"

class CataloCollectionViewController: UIViewController{
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "catalogue"
        configureView()
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
       
    }
    func configureView(){
        viewModel.loadData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CataloCollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else {
            fatalError("Expected '\(SearchCollectionViewCell.self)' type for reusedIdenfier but not found")
        }
       
        if(indexPath.row < viewModel.dataArray.count){
            cell.contentView.backgroundColor = .blue
            print(viewModel.dataArray[indexPath.row].name)            
            cell.configureView(name: viewModel.dataArray[indexPath.row].name)
            
        }
        return cell
    }
}

extension CataloCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128.0, height: 128.0)
    }
}

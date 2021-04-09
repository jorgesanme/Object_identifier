//
//  SearchCollectionViewController.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 08/04/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchCollectionViewController: UIViewController{
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        configureView()
        
    }
    
    func configureView(){
        viewModel.loadData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension SearchCollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        if(indexPath.row < viewModel.dataArray.count){
            cell.contentView.backgroundColor = .blue
            print(viewModel.dataArray[indexPath.row].name)
            cell.configureView(name: viewModel.dataArray[indexPath.row].name)
        }
        return cell
    }
}

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 192.0, height: 192.0) //UIScreen.main.bounds.width
    }
}

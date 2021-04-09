//
//  SearchCollectionViewController.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 08/04/2021.
//

import UIKit

//private let reuseIdentifier = "searchCell"
private let reuseIdentifier = "SearchCollectionViewCell"

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
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
//        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}

extension SearchCollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        if(indexPath.row < viewModel.dataArray.count){
            cell.contentView.backgroundColor = .orange
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
        return CGSize(width: 128, height: 128) //UIScreen.main.bounds.width
    }
}

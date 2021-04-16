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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ViewModel()
    var filteredImage: [ListModel] = []
    
    let searchController = UISearchController ( searchResultsController : nil) // o puede ser -> SearchCollectionViewController()
    
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        configureView()
        setupSearchBar()
       
        
    }
    
    func configureView(){
        viewModel.loadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.addSubview(searchController.searchBar)
    }
    
    func setupSearchBar(){
        // 1
        searchController.searchResultsUpdater = self
        // 2
//        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Busca en el baul"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        searchController.searchBar.delegate = self

     
    }
    
    func filterContentForSearchText(searchText: String ) -> [ListModel] {
        
        if searchText.count > 0 {
            
            filteredImage = viewModel.dataArray
            
            let filteredResult = viewModel.dataArray.filter { $0.name.lowercased().contains(searchText.replacingOccurrences(of: " ", with: "").lowercased())
                
        }
            filteredImage.append(contentsOf: filteredResult)
            filteredImage = filteredResult
            print (filteredImage)
            collectionView.reloadData()
        }

        return filteredImage
    }
    
    func restoreCurrenteDataSource(){
        filteredImage.removeAll()
        collectionView.reloadData()
        
        
    }
    
}

extension SearchCollectionViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (filteredImage.count > 0){
            print("aqui entra en filteredImage")
            return filteredImage.count
        }else {
            return viewModel.dataArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        let verIndice = filteredImage.count
        if (verIndice > 0){
            if(indexPath.row < filteredImage.count){
                cell.contentView.backgroundColor = .orange
                print(filteredImage[indexPath.row].name)
                cell.configureView(name: filteredImage[indexPath.row].name)
            }
        }else {
            if(indexPath.row < viewModel.dataArray.count){
                cell.contentView.backgroundColor = .orange
                print(viewModel.dataArray[indexPath.row].name)
                cell.configureView(name: viewModel.dataArray[indexPath.row].name)
            }
        }
        
        
        
        
        return cell
    }
}
extension SearchCollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //esto es el mensaje al pulsar
        let alertController = UIAlertController(title: "Selection", message: "Selected: \(filteredImage[indexPath.row].name)", preferredStyle: .alert)
        searchController.isActive = false
        
        let okAction = UIAlertAction(title: "Chachi", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        // fin del mensaje
    }
}

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190.0, height: 190.0) //UIScreen.main.bounds.width
    }
}

extension  SearchCollectionViewController : UISearchResultsUpdating  {
    func  updateSearchResults ( for searchController: UISearchController) {
     
        if let searchText = searchController.searchBar.text {
            print(searchText)
            filterContentForSearchText(searchText: searchText)
        }
  }
}
extension SearchCollectionViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = true
        if let searchText = searchBar.text {
            filterContentForSearchText(searchText: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        if let searchText = searchBar.text, !searchText.isEmpty{
            restoreCurrenteDataSource()
            collectionView.reloadData()
        }
    }
}

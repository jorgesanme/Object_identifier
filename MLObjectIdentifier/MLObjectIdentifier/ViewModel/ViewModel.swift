//
//  ViewModel.swift
//  MLObjectIdentifier
//
//  Created by Jorge Sanchez on 06/04/2021.
//

import Foundation

class ViewModel {
    //se cra un mecanismo para enlazar las vista con el modelo
    
    //este closure servirá de puerta de enlace con los datos
    // se modificará según sea necesario
    var refreshData = {() ->() in
        
    }
    
    // se debe crear un array para la lista de fotos    
    var dataArray: [ListModel] = [] {
        didSet{
            refreshData()
        }
    }
    
    // se carga el array con la lista de nombre de las fotos 
    
    func loadData(){
        DispatchQueue.global(qos: .userInitiated).async {
            for i in 0...119 {
                let name = "testImage\(i)"
                self.dataArray.append(ListModel(name: name))
            }
        }
        
    }    
}

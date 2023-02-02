//
//  ImageDetailViewController.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit

class ImageDetailViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func bind(model: String){
        
        print(model)
    }
    
    func setup(){
        navigationItem.title = "Image Detail"
        view.backgroundColor = .systemBackground
    }
}

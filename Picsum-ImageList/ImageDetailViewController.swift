//
//  ImageDetailViewController.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit

class ImageDetailViewController: UIViewController{
    
    let imageImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    func bind(model: String){
        print(model)
        
        imageImageView.image = UIImage(named: "sampleImage")
    }
    
    
}

extension ImageDetailViewController{
    func setup(){
        navigationItem.title = "Image Detail"
        view.backgroundColor = .systemBackground
        
        imageImageView.contentMode = .scaleToFill
        
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageImageView)
    }
    
    func layout(){
        
        NSLayoutConstraint.activate([
            imageImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageImageView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
}

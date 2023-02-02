//
//  MainViewController.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit

class MainViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        style()
        layout()
        
    }
    
}

extension MainViewController{
    func style(){
        // View
        view.backgroundColor = .systemBackground
        
        
    }
    
    func layout(){
        
    }
    
    func configureNavBar(){
        navigationItem.title = "Image List"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .secondarySystemBackground
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

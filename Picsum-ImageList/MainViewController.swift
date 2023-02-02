//
//  MainViewController.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    let tableView = UITableView()
    let imageViewModel = ImageViewModel.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        setup()
        layout()
        bindTableView()
        
        imageViewModel.fetchImages()
    }
    
}

extension MainViewController{
    func bindTableView(){
        imageViewModel.imageListResult.asObservable()
            .bind(to: tableView.rx
                .items(cellIdentifier: ImageTableViewCell.reuseID, cellType: ImageTableViewCell.self))
        {   index, element, cell in
            cell.configureCell(imageModel: element)
            
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ImageModel.self).subscribe { model in
            let imageDetailViewController = ImageDetailViewController()
            imageDetailViewController.bind(model: model)
            self.navigationController?.pushViewController(imageDetailViewController, animated: true)
            
        }.disposed(by: disposeBag)
    }
}

extension MainViewController{
    func setup(){
        // View
        view.backgroundColor = .systemBackground
        
        // Table View
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.reuseID)
        tableView.rowHeight = ImageTableViewCell.rowHeight
        tableView.separatorStyle = .none
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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

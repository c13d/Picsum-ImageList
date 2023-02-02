//
//  ImageDetailViewController.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class ImageDetailViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    let imageImageView = UIImageView()
    let tableView = UITableView()
    let commentListResult = BehaviorRelay<[String]>(value: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        
        bindTableView()
        
        let dummyList = ["a","b","c"]
        commentListResult.accept(dummyList)
    }
    func bind(model: String){
        print(model)
        
        imageImageView.image = UIImage(named: "sampleImage")
    }

}

extension ImageDetailViewController{
    func bindTableView(){
        commentListResult.asObservable()
            .bind(to: tableView.rx
                .items(cellIdentifier: CommentTableViewCell.reuseID, cellType: CommentTableViewCell.self))
        {   index, element, cell in
            cell.configureCell()
            
        }.disposed(by: disposeBag)
        
    }
}

extension ImageDetailViewController{
    func setup(){
        navigationItem.title = "Image Detail"
        view.backgroundColor = .systemBackground
        
        // Image View
        imageImageView.contentMode = .scaleToFill
        
        // Table View
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.reuseID)
        tableView.rowHeight = CommentTableViewCell.rowHeight
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        view.addSubview(imageImageView)
    }
    
    func layout(){
        
        NSLayoutConstraint.activate([
            imageImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageImageView.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.topAnchor.constraint(equalTo: imageImageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

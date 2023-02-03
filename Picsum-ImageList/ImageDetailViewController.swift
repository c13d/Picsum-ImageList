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
    let commentViewModel = CommentViewModel.instance
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        
        bindTableView()
    }
    func bind(model: ImageModel){
        guard let id = Int(model.id) else { return }
        imageImageView.image = UIImage(named: "sampleImage")
        commentViewModel.fetchComments(id: id)
        
        self.id = id
    }

}

extension ImageDetailViewController{
    func bindTableView(){
        commentViewModel.commentListResult.asObservable()
            .bind(to: tableView.rx
                .items(cellIdentifier: CommentTableViewCell.reuseID, cellType: CommentTableViewCell.self))
        {   index, element, cell in
            cell.configureCell(commentModel: element)
        }.disposed(by: disposeBag)
        
        tableView.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            guard let self = self, let id = self.id else { return }
            self.commentViewModel.deleteCommentAt(indexPath: indexPath, id: id)
        }).disposed(by: disposeBag)
    }
}

extension ImageDetailViewController{
    @objc func addTapped(){
        if let id = id{
            commentViewModel.addNewComment(id: id)
        }
    }
}

extension ImageDetailViewController{
    func setup(){
        // Nav bar
        navigationItem.title = "Image Detail"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        // Image View
        imageImageView.contentMode = .scaleToFill
        
        // Table View
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.reuseID)
        tableView.estimatedRowHeight = CommentTableViewCell.rowHeight
        
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

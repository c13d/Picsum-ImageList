//
//  ImageTableViewCell.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit
import RxSwift

class ImageTableViewCell: UITableViewCell{
    var disposeBag = DisposeBag()
    
    static let reuseID = "ImageTableViewCell"
    static let rowHeight: CGFloat = 100
    
    let authorTitleLabel = UILabel()
    let authorLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(){
        authorLabel.text = "Any Name"
    }
}

extension ImageTableViewCell{
    
    private func setup(){
        authorTitleLabel.text = "Author:"
        authorLabel.text = ""
        
        authorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(authorTitleLabel)
        addSubview(authorLabel)
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            authorTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            authorTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            authorTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
}

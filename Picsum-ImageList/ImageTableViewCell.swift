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
    
    let stackView = UIStackView()
    
    let authorTitleLabel = UILabel()
    let authorLabel = UILabel()
    let imageImageView = UIImageView()
    
    let imageSize = rowHeight
    
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
        imageImageView.image = UIImage(named: "sampleImage")
    }
}

extension ImageTableViewCell{
    
    private func setup(){
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        
        authorTitleLabel.text = "Author:"
        authorTitleLabel.textAlignment = .center
        authorTitleLabel.font = UIFont.preferredFont(for: .title3, weight: .bold)
        
        authorLabel.textAlignment = .center
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont.preferredFont(for: .title3, weight: .bold)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        authorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(authorTitleLabel)
        stackView.addArrangedSubview(authorLabel)
    }
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            imageImageView.topAnchor.constraint(equalTo: topAnchor),
            imageImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageImageView.heightAnchor.constraint(equalToConstant: imageSize),
            imageImageView.widthAnchor.constraint(equalToConstant: imageSize),
            
            stackView.leadingAnchor.constraint(equalTo: imageImageView.trailingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
}

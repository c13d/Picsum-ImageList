//
//  ImageTableViewCell.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit
import RxSwift
import SDWebImage

class ImageTableViewCell: UITableViewCell{
    var disposeBag = DisposeBag()
    
    static let reuseID = "ImageTableViewCell"
    static let rowHeight: CGFloat = 116
    
    let backView = ImageTableViewCellBackView()
    let stackView = UIStackView()
    
    let authorTitleLabel = UILabel()
    let authorLabel = UILabel()
    let imageImageView = UIImageView()
    
    let imageSize = rowHeight
    let margin = CGFloat(8)
    
    let downloadImage = DownloadImage.instance
    
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
    
    func configureCell(imageModel: ImageModel){
        authorLabel.text = "\(imageModel.author)"
        
        let transformer = SDImageResizingTransformer(size: CGSize(width: imageSize, height: imageSize), scaleMode: .fill)
        imageImageView.sd_setImage(with: URL(string: imageModel.download_url)){ [weak self]image,_,_,_ in
            guard let self = self else { return }
            
            self.imageImageView.image = self.imageImageView.image?.resizeImageTo(size: CGSize(width: self.imageSize, height: self.imageSize))
            
        }
    }
}

extension ImageTableViewCell{
    
    private func setup(){
        backView.layoutIfNeeded()
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        
        imageImageView.clipsToBounds = true
        imageImageView.layer.masksToBounds = true
        imageImageView.layer.cornerRadius = 10
        imageImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        imageImageView.contentMode = .scaleToFill
        
        authorTitleLabel.text = "Author:"
        authorTitleLabel.textAlignment = .center
        authorTitleLabel.font = UIFont.preferredFont(for: .title3, weight: .bold)
        
        authorLabel.textAlignment = .center
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont.preferredFont(for: .title3, weight: .bold)
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageImageView.translatesAutoresizingMaskIntoConstraints = false
        authorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backView)
        
        backView.addSubview(imageImageView)
        backView.addSubview(stackView)
        
        stackView.addArrangedSubview(authorTitleLabel)
        stackView.addArrangedSubview(authorLabel)
    }
    
    
    
    private func layout(){
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin*2),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin*2),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin),
            
            imageImageView.topAnchor.constraint(equalTo: backView.topAnchor),
            imageImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            imageImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            imageImageView.widthAnchor.constraint(equalToConstant: imageSize-margin*2),
            
            stackView.leadingAnchor.constraint(equalTo: imageImageView.trailingAnchor),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
        ])
        
    }
    
}

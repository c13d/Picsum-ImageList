//
//  CommentTableViewCell.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class CommentTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    
    static let reuseID = "CommentTableViewCell"
    static let rowHeight: CGFloat = 50
    
    let profilePictureView = ProfilePictureView()
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let commentLabel = UILabel()
    let dateAddedLabel = UILabel()
    
    
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
    
    func configureCell(commentModel :CommentEntity){
        guard let firstName = commentModel.firstName, let lastName = commentModel.lastName, let comment = commentModel.comment, let dateAdded = commentModel.dateAdded, let profilePictureUrl = commentModel.profilePictureUrl
        else {return}
        
        nameLabel.text = "\(firstName) \(lastName)"
        commentLabel.text = comment
        dateAddedLabel.text = "\(dateAdded)"
        
        profilePictureView.configureView(text: profilePictureUrl)
    }
}

extension CommentTableViewCell{
    func setup(){
        stackView.axis = .vertical
        stackView.spacing = 8
        
        nameLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        commentLabel.font = UIFont.preferredFont(for: .body, weight: .regular)
        dateAddedLabel.font = UIFont.preferredFont(for: .footnote, weight: .bold)
        dateAddedLabel.textColor = .gray
        commentLabel.numberOfLines = 0
        
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAddedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(profilePictureView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(commentLabel)
        stackView.addArrangedSubview(dateAddedLabel)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            
            profilePictureView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profilePictureView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            profilePictureView.heightAnchor.constraint(equalToConstant: 50),
            profilePictureView.widthAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: profilePictureView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: profilePictureView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

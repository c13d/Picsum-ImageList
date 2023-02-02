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
    
    func configureCell(){
        nameLabel.text = "Any Name"
        commentLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        dateAddedLabel.text = "yesterday"
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
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAddedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(commentLabel)
        stackView.addArrangedSubview(dateAddedLabel)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

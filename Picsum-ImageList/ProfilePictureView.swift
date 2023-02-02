//
//  ProfilePictureView.swift
//  Picsum-ImageList
//
//  Created by Christophorus Davin on 02/02/23.
//

import UIKit

class ProfilePictureView: UIView{
    
    let profilePictureNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.bounds.width / 2
        clipsToBounds = true
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 30, height: 30)
    }
    
    func configureView(text: String){
        profilePictureNameLabel.text = text
    }
    

}

extension ProfilePictureView{
    private func setup(){
        backgroundColor = .gray
        
        profilePictureNameLabel.textColor = .white
        profilePictureNameLabel.textAlignment = .center
        profilePictureNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(profilePictureNameLabel)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            profilePictureNameLabel.topAnchor.constraint(equalTo: topAnchor),
            profilePictureNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePictureNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            profilePictureNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

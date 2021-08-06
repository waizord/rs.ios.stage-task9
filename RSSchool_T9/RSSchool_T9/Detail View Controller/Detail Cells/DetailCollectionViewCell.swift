//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    static let identifier = "DetailCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    func configure(_ image: UIImage) {
        imageView.image = image
        self.addSubview(imageView)
        setStyle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.white.cgColor
    }
    private func setConstraints() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
}

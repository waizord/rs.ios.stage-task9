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
    static let identifire = "DetailCollectionViewCell"
    //let contentType = FillingData.data
    
    let imageView = UIImageView()
    
    func configure() {
        self.addSubview(imageView)
        setStyle()
//        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //setConstraints()
    }
    
    private func setStyle() {
        imageView.frame = CGRect(x: 10, y: 10, width: self.bounds.width - 20, height: self.bounds.height - 20)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .black
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.white.cgColor
    }
//    private func setConstraints() {
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
//        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
//        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
//
//    }
}

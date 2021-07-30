//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    
    func configure() {
        let image = UIImageView(frame: CGRect(x: 8, y: 10, width: self.bounds.width - 16, height: self.bounds.height - 20))
        image.backgroundColor = .blue
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor.black.cgColor
        
        self.addSubview(image)
        self.backgroundColor = .green
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.layer.borderColor = UIColor.black.cgColor
    }
}

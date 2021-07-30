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
    let contentType = FillingData.data
    
    func configure(index: Int) {
        let view = UIImageView(frame: CGRect(x: 8, y: 10, width: self.bounds.width - 16, height: self.bounds.height - 20))
        let content = contentType[index]
        
        switch content {
        case .gallery(let galery):
            print(galery)
            view.image = galery.coverImage
        case .story(let story):
            print(story)
            view.image = story.coverImage
        }
        
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        
        self.addSubview(view)
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.layer.borderColor = UIColor.black.cgColor
    }
}

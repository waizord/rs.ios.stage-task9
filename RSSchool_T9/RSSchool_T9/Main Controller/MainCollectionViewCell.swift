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
        let imageView = UIImageView(frame: CGRect(x: 8, y: 10, width: self.bounds.width - 16, height: self.bounds.height - 20))
        
        //style image view and this cell
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.layer.borderColor = UIColor.black.cgColor
        
        //add gradient color
        let gradientView = UIView(frame: imageView.bounds)
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.7, 1.0]
        gradientView.layer.insertSublayer(gradient, at: 0)
        
        //add label on image view
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel.contentMode = .scaleToFill
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.frame.height * 0.075))
        titleLabel.textColor = .white
        
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.frame.height * 0.06))
        typeLabel.textColor = UIColor.init(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        
        let content = contentType[index]
        
        //add info on cell
        switch content {
        case .gallery(let galery):
            print(galery)
            imageView.image = galery.coverImage
            titleLabel.text = galery.title
            typeLabel.text = galery.type
        case .story(let story):
            print(story)
            imageView.image = story.coverImage
            titleLabel.text = story.title
            typeLabel.text = story.type
        }
        
        //add all views on image view
        imageView.addSubview(gradientView)
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(typeLabel)
        
        //constraints labels
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.75).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width * 0.1).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -(self.frame.width * 0.1)).isActive = true

        typeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: self.frame.height * 0.014).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width * 0.1).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

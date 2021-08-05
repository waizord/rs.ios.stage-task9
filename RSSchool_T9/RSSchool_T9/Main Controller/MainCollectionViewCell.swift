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
    
    let titleLabel = PaddingLabel()
    let typeLabel = PaddingLabel()
    let imageView = UIImageView()
    let gradientView = UIView()
    let gradient = CAGradientLayer()

    
    func configure(index: Int) {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        //setting label on image view
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.bounds.height * 0.075))
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .white
        titleLabel.padding(5, 0, 0, 0)
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
//        typeLabel.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.bounds.height * 0.06))
        typeLabel.textColor = UIColor.init(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        typeLabel.padding(2, 0, 0, 0)
        
        //add info on cell
        let content = contentType[index]
        
        switch content {
        case .gallery(let galery):
            //print(galery)
            imageView.image = galery.coverImage
            titleLabel.text = galery.title.trimmingCharacters(in: NSCharacterSet.newlines)
            typeLabel.text = galery.type.trimmingCharacters(in: NSCharacterSet.newlines)
        case .story(let story):
            //print(story)
            imageView.image = story.coverImage
            titleLabel.text = story.title.trimmingCharacters(in: NSCharacterSet.newlines)
            typeLabel.text = story.type.trimmingCharacters(in: NSCharacterSet.newlines)
        }
        
        //add all views on image view
        self.addSubview(imageView)
        imageView.addSubview(gradientView)
        self.addSubview(titleLabel)
        self.addSubview(typeLabel)
        //self.setConstraints(self)
    }
    
    func setGradient() {
        gradient.frame = CGRect(x: 8, y: 10, width: self.bounds.width - 16, height: self.bounds.height - 20)
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.7, 1.0]
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.setConstraints(self)
        setGradient()
    }
    
    //constraints labels
    func setConstraints(_ viewSize: UIView) {
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: viewSize.topAnchor, constant: 10),
        imageView.leadingAnchor.constraint(equalTo: viewSize.leadingAnchor, constant: 8),
        imageView.trailingAnchor.constraint(equalTo: viewSize.trailingAnchor, constant: -8),
        imageView.bottomAnchor.constraint(equalTo: viewSize.bottomAnchor, constant: -10),
        
        gradientView.topAnchor.constraint(equalTo: viewSize.topAnchor),
        gradientView.leadingAnchor.constraint(equalTo: viewSize.leadingAnchor),
        gradientView.trailingAnchor.constraint(equalTo: viewSize.trailingAnchor),
        gradientView.bottomAnchor.constraint(equalTo: viewSize.bottomAnchor),
        
        titleLabel.bottomAnchor.constraint(equalTo: viewSize.bottomAnchor, constant: -40),
        titleLabel.leadingAnchor.constraint(equalTo: viewSize.leadingAnchor, constant: 15),
        titleLabel.widthAnchor.constraint(equalToConstant: (viewSize.frame.width * 0.87)),

        typeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: viewSize.frame.height * 0.015),
        typeLabel.leadingAnchor.constraint(equalTo: viewSize.leadingAnchor, constant: 15),
        typeLabel.trailingAnchor.constraint(equalTo: viewSize.trailingAnchor)
        ])
        
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: CGFloat(viewSize.bounds.height * 0.074))
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: CGFloat(viewSize.bounds.height * 0.06))
    }
    
    func deactivateConstraints() {
        NSLayoutConstraint.deactivate(
            imageView.constraints
        )
        NSLayoutConstraint.deactivate(
            gradientView.constraints
        )
        NSLayoutConstraint.deactivate(
            titleLabel.constraints
        )
        NSLayoutConstraint.deactivate(
            typeLabel.constraints
        )
        
    }
}

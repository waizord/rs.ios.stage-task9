//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    let contentType = FillingData.data
    
    let scrolView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(tapOnCloseButton), for: .touchUpInside)
        return button
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    let gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.5, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.text = "LabelViewLabelViewLabelViewLabelView"
        view.font = UIFont(name: "Rockwell-Regular", size: 48)
        view.textColor = .white
        return view
    }()
    
    let typeLabel: PaddingLabel = {
        let view = PaddingLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.text = "LabelView"
        view.font = UIFont(name: "Rockwell-Regular", size: 24)
        view.textColor = .white
        view.padding(8, 3, 30, 30)
        return view
    }()
    
    let lineView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let collectionPathView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .black
        collection.layer.cornerRadius = 8
        collection.layer.borderWidth = 1
        collection.layer.borderColor = UIColor.white.cgColor
        return collection
    }()
    
    let collectionImagesView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .black
        collection.layer.cornerRadius = 8
        collection.layer.borderWidth = 1
        collection.layer.borderColor = UIColor.white.cgColor
        return collection
    }()
    
    let supportTextView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    let textLabel: UITextView = {
        let view = UITextView()
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 40)
        view.text = "LabelView"
        view.font = UIFont(name: "Rockwell-Regular", size: 24)
        view.textColor = .white
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.scrolView.delegate = self
        self.view.addSubview(closeButton)
        self.view.addSubview(scrolView)
        self.scrolView.addSubview(imageView)
        self.imageView.addSubview(gradientView)
        self.addGradient()
        self.imageView.addSubview(titleLabel)
        self.scrolView.addSubview(lineView)
        self.scrolView.addSubview(typeLabel)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = .black
    }
    
    //MARK: - Action
    @objc func tapOnCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Styles story and gellery
    func setDetail(_ index: Int) {
        
        let content = contentType[index]
        
        switch content {
        case .gallery(let galery):
            //print(galery)
            imageView.image = galery.coverImage
            titleLabel.text = galery.title
            typeLabel.text = galery.type
            self.scrolView.addSubview(collectionImagesView)
            self.setConstraintForGallery()
        case .story(let story):
            //print(story)
            imageView.image = story.coverImage
            titleLabel.text = story.title
            typeLabel.text = story.type
            textLabel.text = story.text
            self.scrolView.addSubview(collectionPathView)
            self.scrolView.addSubview(textLabel)
            self.setConstraintForStory()
        }
    }
    
    func addGradient() {
//        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        print(gradientView.frame)
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.5, 1.0]
        
        gradientView.layer.insertSublayer(gradient, at: 0)
//        imageView.addSubview(gradientView)
    }
    //MARK: - Constraints
    func setConstraintForStory() {
        settingConstraintsScrollView()
        settingConstraintsButtonView()
        settingConstraintsImageView()
        settingConstraintsGradientView()
        settingConstraintsTitleLabel()
        settingConstraintsTypeLabel()
        settingConstraintsLineView()
        settingConstraintsCollectionPathView()
        settingConstraintsTextView()
    }
    
    func setConstraintForGallery() {
        settingConstraintsScrollView()
        settingConstraintsButtonView()
        settingConstraintsImageView()
        settingConstraintsGradientView()
        settingConstraintsTitleLabel()
        settingConstraintsTypeLabel()
        settingConstraintsLineView()
        settingConstraintsCollectionImagesView()
    }
    
    func settingConstraintsScrollView() {
        self.scrolView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        self.scrolView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.scrolView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.scrolView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func settingConstraintsButtonView() {
        self.closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        self.closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func settingConstraintsImageView() {
        self.imageView.topAnchor.constraint(equalTo: scrolView.topAnchor).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: scrolView.leftAnchor, constant: 20).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: scrolView.rightAnchor, constant: -20).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    func settingConstraintsGradientView() {
        self.gradientView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        self.gradientView.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        self.gradientView.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        self.gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    func settingConstraintsTitleLabel() {
        self.titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 30).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -30).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    }
    
    func settingConstraintsTypeLabel() {
        self.typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        self.typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    func settingConstraintsLineView() {
        self.lineView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 58).isActive = true
        self.lineView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        self.lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.lineView.widthAnchor.constraint(equalToConstant: 214).isActive = true
    }
    
    func settingConstraintsCollectionPathView() {
        self.collectionPathView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
        self.collectionPathView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        self.collectionPathView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        self.collectionPathView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
        self.collectionPathView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func settingConstraintsCollectionImagesView() {
        self.collectionImagesView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
        self.collectionImagesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        self.collectionImagesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        self.collectionImagesView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
        self.collectionImagesView.heightAnchor.constraint(equalToConstant: 511).isActive = true
        self.collectionImagesView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30).isActive = true
    }
    
    func settingConstraintsTextView() {
        self.textLabel.topAnchor.constraint(equalTo: collectionPathView.bottomAnchor, constant: 40).isActive = true
        self.textLabel.leftAnchor.constraint(equalTo: scrolView.leftAnchor, constant: 20).isActive = true
        self.textLabel.rightAnchor.constraint(equalTo: scrolView.rightAnchor, constant: -20).isActive = true
        self.textLabel.centerXAnchor.constraint(equalTo: collectionPathView.centerXAnchor).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30).isActive = true
    }
}

/// Add pading for text in labels
class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}

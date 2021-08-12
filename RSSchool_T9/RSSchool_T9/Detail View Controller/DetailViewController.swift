//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DetailViewController: UIViewController {
    
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
    
    let gradient = CAGradientLayer()
    
    let gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: PaddingLabel = {
        let view = PaddingLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.text = "Title"
        view.font = UIFont(name: "Rockwell-Regular", size: 48)
        view.textColor = .white
        view.padding(5, 5, 5, 0)
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
        view.text = "Label"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = .blue
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addGradient(frame: self.gradientView.frame)
    }
    
    //MARK: - Action
    @objc func tapOnCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

    //MARK: - Styles story and gellery
extension DetailViewController {
    func setDetail(_ index: Int) -> UIViewController {
        
        let content = contentType[index]
        
        switch content {
        case .gallery(let gallery):
            let galleryVC = GalleryViewController()
            galleryVC.setGallery(gallery)
            return galleryVC
            
        case .story(let story):
            let storyVC = StoryViewController()
            storyVC.setStory(story)
            return storyVC
        }
    }
    
    private func addGradient(frame: CGRect) {
        gradient.frame = frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.5).cgColor]
        gradient.locations = [0.5, 1.0]
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
}

    //MARK: - Constraints
extension DetailViewController {
    func addAllDetailViews() {
        self.view.addSubview(scrolView)
        self.scrolView.addSubview(closeButton)
        self.scrolView.addSubview(imageView)
        self.imageView.addSubview(gradientView)
        self.gradientView.addSubview(titleLabel)
        self.scrolView.addSubview(lineView)
        self.scrolView.addSubview(typeLabel)
    }
    func setConstraintDetailView() {
        settingConstraintsScrollView()
        settingConstraintsButtonView()
        settingConstraintsImageView()
        settingConstraintsGradientView()
        settingConstraintsTitleLabel()
        settingConstraintsTypeLabel()
        settingConstraintsLineView()
    }
    
    private func settingConstraintsScrollView() {
        self.scrolView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.scrolView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.scrolView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.scrolView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func settingConstraintsButtonView() {
        self.closeButton.topAnchor.constraint(equalTo: scrolView.contentLayoutGuide.topAnchor, constant: 30).isActive = true
        self.closeButton.trailingAnchor.constraint(equalTo: scrolView.contentLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func settingConstraintsImageView() {
        self.imageView.topAnchor.constraint(equalTo: scrolView.contentLayoutGuide.topAnchor,constant: 100).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: scrolView.contentLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: scrolView.contentLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func settingConstraintsGradientView() {
        self.gradientView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        self.gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        self.gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        self.gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    private func settingConstraintsTitleLabel() {
        self.titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -55).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    }
    
    private func settingConstraintsTypeLabel() {
        self.typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        self.typeLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    private func settingConstraintsLineView() {
        self.lineView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 58).isActive = true
        self.lineView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        self.lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.lineView.widthAnchor.constraint(equalToConstant: 214).isActive = true
    }
}

    //MARK: - Support class
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

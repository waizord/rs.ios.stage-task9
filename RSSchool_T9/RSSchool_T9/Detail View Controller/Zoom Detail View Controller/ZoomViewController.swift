//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ZoomViewController: UIViewController {
    
    var imageScrollView: ImageScrollView!
    var image: UIImage = UIImage()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        view.addSubview(closeButton)
        
        settingConstraintsButtonView()
        settingConstraintImageScrollView()
        
        self.imageScrollView.set(self.image)
        
        self.hideCloseButtonWhenTappedAround()
    }
    
    func getImage(_ image: UIImage) {
        self.image = image
    }
    
    //MARK: - Action
    @objc func tapOnCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

    //MARK: - Constraints
extension ZoomViewController {
    private func settingConstraintsButtonView() {
        self.closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        self.closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func settingConstraintImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ZoomViewController {
    func hideCloseButtonWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissCloseButton))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissCloseButton() {
        if closeButton.isHidden {
            self.closeButton.isHidden = false
        } else {
            self.closeButton.isHidden = true
        }
    }
}

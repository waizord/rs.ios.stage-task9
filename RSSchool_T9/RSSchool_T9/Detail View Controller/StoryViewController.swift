//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryViewController: DetailViewController {

    let drawScrollView: DrawScrollView = {
        let view = DrawScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
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

        self.scrolView.addSubview(drawScrollView)
        self.scrolView.addSubview(textLabel)
        
        self.setConstraintDetailView()
        settingConstraintsDrawScrollView()
        settingConstraintsTextView()
    }
    
    func setStory( _ story: Story) {
        self.imageView.image = story.coverImage
        self.titleLabel.text = story.title.trimmingCharacters(in: NSCharacterSet.newlines)
        self.typeLabel.text = story.type
        textLabel.text = story.text.trimmingCharacters(in: NSCharacterSet.newlines)
    }
}

//MARK: - Constraints
extension StoryViewController {
    private func settingConstraintsDrawScrollView() {
        self.drawScrollView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
        self.drawScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        self.drawScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        self.drawScrollView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
        self.drawScrollView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func settingConstraintsTextView() {
        self.textLabel.topAnchor.constraint(equalTo: drawScrollView.bottomAnchor, constant: 40).isActive = true
        self.textLabel.leftAnchor.constraint(equalTo: scrolView.leftAnchor, constant: 20).isActive = true
        self.textLabel.rightAnchor.constraint(equalTo: scrolView.rightAnchor, constant: -20).isActive = true
        self.textLabel.centerXAnchor.constraint(equalTo: drawScrollView.centerXAnchor).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30).isActive = true
    }
}

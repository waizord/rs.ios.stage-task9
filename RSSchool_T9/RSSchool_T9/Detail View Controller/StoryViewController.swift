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
    
    var settingApp = SettingApp()
    var drawPath = [CGPath]()
    
    var userDefault = UserDefaults.standard

    let drawCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collection = DynamicCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .black
        return collection
    }()
    
    let textView: UITextView = {
        let view = UITextView()
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
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
        
        if let nameColor = self.userDefault.string(forKey: "nameColor") {
            let isDraw = self.userDefault.bool(forKey: "isDraw")
            self.settingApp = SettingApp(nameColor: nameColor, isActive: isDraw)
        }
        
        drawCollectionView.register(DrawCollectionViewCell.self, forCellWithReuseIdentifier: DrawCollectionViewCell.identifier)
        drawCollectionView.dataSource = self
        drawCollectionView.delegate = self

        self.addAllDetailViews()
        self.scrolView.addSubview(drawCollectionView)
        self.scrolView.addSubview(textView)
        
//        self.setConstraintDetailView()
//        settingConstraintsDrawScrollView()
//        settingConstraintsTextView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setConstraintDetailView()
        settingConstraintsDrawScrollView()
        settingConstraintsTextView()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        drawCollectionView.collectionViewLayout.invalidateLayout()
        super.willTransition(to: newCollection, with: coordinator)
    }
    
    func setStory( _ story: Story) {
        self.imageView.image = story.coverImage
        self.titleLabel.text = story.title.trimmingCharacters(in: NSCharacterSet.newlines)
        self.typeLabel.text = story.type
        textView.text = story.text.trimmingCharacters(in: NSCharacterSet.newlines)
        drawPath = story.paths
    }
}
//MARK: - Delegates
extension StoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drawPath.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = drawCollectionView.dequeueReusableCell(withReuseIdentifier: DrawCollectionViewCell.identifier, for: indexPath) as! DrawCollectionViewCell
        if cell.isHidden {
            cell.clean()
        }
        let path = drawPath[indexPath.row]
        cell.drawImage(with: path, settings: settingApp)
        return cell
    }
}
extension StoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 73, height: 60.43)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    }
}

//MARK: - Constraints
extension StoryViewController {
    private func settingConstraintsDrawScrollView() {
        self.drawCollectionView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
        self.drawCollectionView.widthAnchor.constraint(equalToConstant: view.bounds.width - 80).isActive = true
        self.drawCollectionView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
        self.drawCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func settingConstraintsTextView() {
        self.textView.topAnchor.constraint(equalTo: drawCollectionView.bottomAnchor, constant: 40).isActive = true
        self.textView.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor, constant: 20).isActive = true
        self.textView.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor, constant: -20).isActive = true
        self.textView.centerXAnchor.constraint(equalTo: drawCollectionView.centerXAnchor).isActive = true
        self.textView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30).isActive = true
    }
}

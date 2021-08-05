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
    
    let settingApp = SettingApp()
    var drawPath = [CGPath]()

    let drawCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collection = DynamicCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .black
        return collection
    }()
    
    let textLabel: UITextView = {
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
        drawCollectionView.register(DrawCollectionViewCell.self, forCellWithReuseIdentifier: DrawCollectionViewCell.identifier)
        drawCollectionView.dataSource = self
        drawCollectionView.delegate = self

        self.addAllDetailViews()
        self.scrolView.addSubview(drawCollectionView)
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
        //cell.backgroundColor = .blue
        print(settingApp.color, settingApp.isDraw)
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
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 30)
    }
}

//MARK: - Constraints
extension StoryViewController {
    private func settingConstraintsDrawScrollView() {
        self.drawCollectionView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
        self.drawCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.drawCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        //self.drawCollectionView.heightAnchor.constraint(equalToConstant: 495).isActive = true
        self.drawCollectionView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
        self.drawCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func settingConstraintsTextView() {
        self.textLabel.topAnchor.constraint(equalTo: drawCollectionView.bottomAnchor, constant: 40).isActive = true
        self.textLabel.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor, constant: 20).isActive = true
        self.textLabel.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor, constant: -20).isActive = true
        self.textLabel.centerXAnchor.constraint(equalTo: drawCollectionView.centerXAnchor).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30).isActive = true
    }
}

//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class MainViewController: UIViewController {
    
    let arrayItems = [FillingData]()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .white
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        settingConstraintsCollectionView()
    }
    
    //MARK: Constraints
    func settingConstraintsCollectionView() {
        self.collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.collectionView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40).isActive = true
    }
}
//MARK: - Delegates and datasource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        cell.configure(index: indexPath.row)
        return cell
    }
}
extension MainViewController: UICollectionViewDelegate {
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let showVC = detailVC.setDetail(indexPath.row)
        showVC.modalPresentationStyle = .fullScreen
        self.showDetailViewController(showVC, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isPortrait {
            
//            var height = view.bounds.height * 0.246
//            var wight = view.bounds.height * 0.814
            return CGSize(width: self.view.frame.width * 0.43, height: (self.view.frame.width * 0.43) * 1.23)
        }else {
            return CGSize(width: self.view.frame.height * 0.43, height: (self.view.frame.height * 0.43) * 1.23)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if UIDevice.current.orientation.isPortrait {
            return self.view.bounds.height * 0.034
        }else {
            return self.view.bounds.width * 0.034
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if UIDevice.current.orientation.isPortrait {
            return self.view.bounds.width * 0.033
        }else {
            return self.view.bounds.height * 0.033
        }
    }
}

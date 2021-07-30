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
        flowLayout.minimumLineSpacing = 30
        flowLayout.minimumInteritemSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("safeArea -> \(view.safeAreaLayoutGuide.layoutFrame), view -> \(view.frame)")
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.backgroundColor = .blue
        collectionView.backgroundColor = .orange
        
        view.addSubview(collectionView)
        
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        cell.configure()
        return cell
    }
    
}
extension MainViewController: UICollectionViewDelegate {
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 179, height: 220)
    }
}

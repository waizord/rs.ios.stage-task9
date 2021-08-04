//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryViewController: DetailViewController {
    
    var galleryImages = [UIImage]()
    
    let collectionImagesView: DynamicCollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collection = DynamicCollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .black
        collection.isScrollEnabled = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionImagesView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        collectionImagesView.dataSource = self
        collectionImagesView.delegate = self

        self.scrolView.addSubview(collectionImagesView)
        
        self.setConstraintDetailView()
        settingConstraintsCollectionImagesView()
    }
    
    func setGallery( _ gallery: Gallery) {
        imageView.image = gallery.coverImage
        titleLabel.text = gallery.title
        typeLabel.text = gallery.type
        galleryImages = gallery.images
    }
}


//MARK: - Delegates and DataSource
extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellImages = collectionImagesView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as! DetailCollectionViewCell
        
        cellImages.imageView.image = galleryImages[indexPath.row]
        cellImages.configure()
        return cellImages
    }
}
    
extension GalleryViewController: UICollectionViewDelegate {
    
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionImagesView.bounds.width, height: collectionImagesView.bounds.width * 1.37) 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

//MARK: - Constraints
extension GalleryViewController {
    private func settingConstraintsCollectionImagesView() {
        self.collectionImagesView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
        self.collectionImagesView.leftAnchor.constraint(equalTo: scrolView.leftAnchor, constant: 20).isActive = true
        self.collectionImagesView.rightAnchor.constraint(equalTo: scrolView.rightAnchor, constant: -20).isActive = true
        self.collectionImagesView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
        self.collectionImagesView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30).isActive = true
    }
}

///Needed for make height constraint of collectionView
class DynamicCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        return self.contentSize
    }
}

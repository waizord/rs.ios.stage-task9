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
    
    var width: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionImagesView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        collectionImagesView.dataSource = self
        collectionImagesView.delegate = self

        self.addAllDetailViews()
        self.scrolView.addSubview(collectionImagesView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setConstraintDetailView()
        settingConstraintsCollectionImagesView()
    }
    
    func setGallery( _ gallery: Gallery) {
        imageView.image = gallery.coverImage
        titleLabel.text = gallery.title.trimmingCharacters(in: NSCharacterSet.newlines)
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
        let cell = collectionImagesView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as! DetailCollectionViewCell
        
        let image = galleryImages[indexPath.row]
        cell.configure(image)
        return cell
    }
}
    
extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let zoomVC = ZoomViewController()
        zoomVC.getImage(galleryImages[indexPath.row])
        zoomVC.modalPresentationStyle = .fullScreen
        self.showDetailViewController(zoomVC, sender: nil)
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cgsize = CGSize()
        if view.bounds.height > view.bounds.width {
            cgsize = CGSize(width: view.bounds.width - 40, height: (view.bounds.width - 40) * 1.37)
        }
        if view.bounds.width > view.bounds.height {
            cgsize = CGSize(width: (view.bounds.height - 40), height: (view.bounds.height - 40) * 1.37)
        }
        return cgsize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 150
    }
}

//MARK: - Constraints
extension GalleryViewController {
    private func settingConstraintsCollectionImagesView() {
        NSLayoutConstraint.activate([
        self.collectionImagesView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40),
        self.collectionImagesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        self.collectionImagesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        self.collectionImagesView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor, constant: -30)
        ])
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

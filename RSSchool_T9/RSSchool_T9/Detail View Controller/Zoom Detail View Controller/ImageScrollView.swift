//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ImageScrollView: UIScrollView, UIScrollViewDelegate {

    var imageZoomView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.centerImage()
    }
    
    func set(_ image: UIImage) {
        imageZoomView?.removeFromSuperview()
        imageZoomView = nil
        
        imageZoomView = UIImageView(image: image)
        imageZoomView.contentMode = .scaleAspectFill
        imageZoomView.clipsToBounds = true
        //imageZoomView.center = self.center
        self.addSubview(imageZoomView)
        
        configureFor(image.size)
    }
    
    func configureFor( _ imageSize: CGSize){
        
        let zoomScale = min(self.bounds.size.width / imageSize.width, self.bounds.size.height / imageSize.height);

            if (zoomScale > 1) {
                self.minimumZoomScale = 1;
            }

        self.minimumZoomScale = zoomScale
        self.maximumZoomScale = 3
        self.zoomScale = zoomScale
        
    }
    
    var scrollViewVisibleSize: CGSize {
        let contentInset = self.contentInset
        let scrollViewSize = self.bounds.standardized.size
        let width = scrollViewSize.width - contentInset.left - contentInset.right
        let height = scrollViewSize.height - contentInset.top - contentInset.bottom
        return CGSize(width:width, height:height)
    }

    private var scrollViewCenter: CGPoint {
        let scrollViewSize = self.scrollViewVisibleSize
        return CGPoint(x: scrollViewSize.width / 2.0,
                       y: scrollViewSize.height / 2.0)
    }

    private func centerScrollViewContents() {
        guard let image = imageZoomView.image else {
            return
        }

        let imgViewSize = imageZoomView.frame.size
        let imageSize = image.size

        var realImgSize: CGSize
        if imageSize.width / imageSize.height > imgViewSize.width / imgViewSize.height {
            realImgSize = CGSize(width: imgViewSize.width,height: imgViewSize.width / imageSize.width * imageSize.height)
        } else {
            realImgSize = CGSize(width: imgViewSize.height / imageSize.height * imageSize.width, height: imgViewSize.height)
        }

        var frame = CGRect.zero
        frame.size = realImgSize
        imageZoomView.frame = frame

        let screenSize  = self.frame.size
        let offx = screenSize.width > realImgSize.width ? (screenSize.width - realImgSize.width) / 2 : 0
        let offy = screenSize.height > realImgSize.height ? (screenSize.height - realImgSize.height) / 2 : 0
        self.contentInset = UIEdgeInsets(top: offy,
                                               left: offx,
                                               bottom: offy,
                                               right: offx)

        // The scroll view has zoomed, so you need to re-center the contents
        let scrollViewSize = scrollViewVisibleSize

        // First assume that image center coincides with the contents box center.
        // This is correct when the image is bigger than scrollView due to zoom
        var imageCenter = CGPoint(x: self.contentSize.width / 2.0,
                                  y: self.contentSize.height / 2.0)

        let center = scrollViewCenter

        //if image is smaller than the scrollView visible size - fix the image center accordingly
        if self.contentSize.width < scrollViewSize.width {
            imageCenter.x = center.x
        }

        if self.contentSize.height < scrollViewSize.height {
            imageCenter.y = center.y
        }

        imageZoomView.center = imageCenter
    }
    //MARK: - Delegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageZoomView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContents()
    }
}

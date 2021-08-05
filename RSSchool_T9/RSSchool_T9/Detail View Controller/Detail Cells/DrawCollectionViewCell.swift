//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DrawCollectionViewCell: UICollectionViewCell {
    static let identifier = "DrawCollectionViewCell"
    private var shapeLayer: CAShapeLayer!
    
    func drawImage(with path: CGPath, settings: SettingApp) {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.frame = self.bounds
        shapeLayer.strokeColor = settings.color.cgColor
        shapeLayer.lineWidth = 1
        
        if settings.isDraw {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 3
            animation.fromValue = 0
            animation.toValue = 1
            shapeLayer.add(animation, forKey: "animatePath")
        }
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func clean() {
        shapeLayer.removeFromSuperlayer()
    }
//        self.addSubview(drawView)
//    func settingConstraintsDrawView() {
//        NSLayoutConstraint.activate([
//        self.drawView.topAnchor.constraint(equalTo: self.topAnchor),
//        self.drawView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//        self.drawView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//        self.drawView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

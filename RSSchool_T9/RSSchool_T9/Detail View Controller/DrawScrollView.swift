//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DrawScrollView: UIScrollView {
    
    let drawView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    let missView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("draw")
    }

//    func settingConstraintsDrawView() {
//        self.drawView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40).isActive = true
//        self.drawView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        self.drawView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        self.drawView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor).isActive = true
//        self.drawView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

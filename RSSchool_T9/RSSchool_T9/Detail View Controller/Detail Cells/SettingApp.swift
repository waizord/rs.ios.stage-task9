//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/5/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation
class SettingApp: NSObject {
    let color: UIColor
    let isDraw: Bool
    let stringColor: String
    
    override init() {
        self.color = UIColor.init(hexString: "#be2813")
        self.isDraw = true
        self.stringColor = "#be2813"
    }
}

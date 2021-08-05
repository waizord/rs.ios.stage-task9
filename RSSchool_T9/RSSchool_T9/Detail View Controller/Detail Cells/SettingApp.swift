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
    var color: UIColor
    var isDraw: Bool
    var nameColor: String
    
    override init() {
        self.color = UIColor.init(hexString: "#f3af22")
        self.isDraw = true
        self.nameColor = "#f3af22"
    }
    init(nameColor: String, isActive: Bool) {
        self.color = UIColor.init(hexString: nameColor)
        self.isDraw = isActive
        self.nameColor = nameColor
    }
}

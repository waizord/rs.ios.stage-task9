//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation
extension CGPath {
    static let story5path1: CGPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 13.4, y: 44.9))
        path.addCurve(to: CGPoint(x: 14.4, y: 31), controlPoint1: CGPoint(x: 13.4, y: 41), controlPoint2: CGPoint(x: 16.6, y: 34.9))
        path.addCurve(to: CGPoint(x: 4.6, y: 23.4), controlPoint1: CGPoint(x: 11.5, y: 25.9), controlPoint2: CGPoint(x: 4, y: 31))
        path.addCurve(to: CGPoint(x: 11.3, y: 21.2), controlPoint1: CGPoint(x: 4.9, y: 18.9), controlPoint2: CGPoint(x: 8.7, y: 21.2))
        path.addCurve(to: CGPoint(x: 32.1, y: 25), controlPoint1: CGPoint(x: 17.7, y: 21.2), controlPoint2: CGPoint(x: 27.2, y: 20.7))
        path.addCurve(to: CGPoint(x: 23.2, y: 31.5), controlPoint1: CGPoint(x: 38.8, y: 30.9), controlPoint2: CGPoint(x: 23.6, y: 31))
        path.addCurve(to: CGPoint(x: 20, y: 48.8), controlPoint1: CGPoint(x: 19.6, y: 36.1), controlPoint2: CGPoint(x: 25.5, y: 44.1))
        path.addCurve(to: CGPoint(x: 13.2, y: 44.4), controlPoint1: CGPoint(x: 17, y: 51.4), controlPoint2: CGPoint(x: 13.6, y: 46.6))
        path.close()
        return path.cgPath
    }()
}

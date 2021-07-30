//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func SettingTabbar() {

        //Designing Tabbar Item Images
        let items = UITabBarItem(title: "Items", image: UIImage(systemName: "square.grid.2x2") , tag: 0)
        let setting = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 1)
        

        //Getting TabBar ViewControllers
        let mainVC = MainViewController()
        let settingVC = SettingViewController()
        mainVC.tabBarItem = items
        settingVC.tabBarItem = setting
        self.viewControllers = [mainVC, settingVC]
        
        //Set colors
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.barTintColor = .white

    }

}

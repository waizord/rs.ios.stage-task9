//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "NavigationController.h"
#import "SettingViewController.h"

@interface NavigationController ()
@property (strong, nonatomic) SettingViewController *settingVC;
@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)settingNavBar {
    self.settingVC = [[SettingViewController alloc] init];
    [self addChildViewController:self.settingVC];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

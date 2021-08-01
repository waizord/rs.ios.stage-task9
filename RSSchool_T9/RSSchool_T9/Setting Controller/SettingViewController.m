//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingTableView];
    
    [self.table registerClass:SettingTableViewCell.class forCellReuseIdentifier: [SettingTableViewCell new].identifier];
    self.table.dataSource = self;
    self.table.delegate = self;
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.table];
    [self settingNavBar];
}

-(void)settingTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.table.scrollEnabled = NO;
}

- (void)settingNavBar {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Settings";
    label.font = [UIFont fontWithName:@"SFProDisplay-Semibold" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    [label sizeToFit];
    
    self.navigationController.navigationBar.barTintColor = UIColor.whiteColor;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


@end

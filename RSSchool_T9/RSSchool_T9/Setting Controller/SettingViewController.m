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
#import "SettingColorViewController.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) SettingColorViewController *settingColorVC;
@property (nonatomic, strong) NSUserDefaults *userDefault;
@property (nonatomic) BOOL isDraw;
@property (nonatomic, strong) NSString *nameColor;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefault = NSUserDefaults.standardUserDefaults;
    self.isDraw = [self.userDefault boolForKey:@"isDraw"];
    self.nameColor = [[NSString alloc] initWithString:[self.userDefault stringForKey:@"nameColor"]];
    [self settingTableView];
    
    [self.table registerClass:SettingTableViewCell.class forCellReuseIdentifier: [SettingTableViewCell new].identifier];
    self.table.dataSource = self;
    self.table.delegate = self;
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.table];
    [self settingNavBar];
}

- (void)settingTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.table.scrollEnabled = NO;
}

- (void)settingNavBar {
    self.title = @"Settings";
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SettingTableViewCell new].identifier forIndexPath:indexPath];
    cell = [[SettingTableViewCell new] configureRow:indexPath.row isDraw:self.isDraw nameColor: self.nameColor];
    //cell.detailTextLabel.text = self.nameColor;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        self.settingColorVC = [[SettingColorViewController alloc] init];
        [self showViewController:self.settingColorVC sender:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    
    NSLog(@"tap");
}

@end

//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingViewController.h"
#import "SettingColorViewController.h"
#import "UIColor+CustomColors.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) SettingColorViewController *settingColorVC;
@property (nonatomic, strong) NSUserDefaults *userDefault;
@property (nonatomic) BOOL isDraw;
@property (nonatomic, strong) NSString *nameColor;
@property (nonatomic) UISwitch *switchView;
@end

@implementation SettingViewController

- (void)colorName:(NSString *)name {
    self.userDefault = NSUserDefaults.standardUserDefaults;
    [self.userDefault setValue:name forKey:@"nameColor"];
    NSLog(@"delegate color %@", [self.userDefault stringForKey:@"nameColor"]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.table reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self settingTableView];
    [self settingNavBar];
}

//MARK: - Set style
- (void)settingTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.table.scrollEnabled = NO;
    [self.view addSubview:self.table];
    self.table.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.table registerClass:UITableViewCell.class forCellReuseIdentifier:@"SettingCell"];
    self.table.dataSource = self;
    self.table.delegate = self;
    
    [self.table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
     [self.table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
      [self.table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
       [self.table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES; 
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

//MARK: - Action
- (void) swichChangeValue {
    NSLog(@"%d", self.switchView.isOn);
    NSUserDefaults *userDefaults = NSUserDefaults.standardUserDefaults;
    [userDefaults setBool:self.switchView.isOn forKey:@"isDraw"];
}

//MARK: - DataSorse and delegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    
    self.userDefault = NSUserDefaults.standardUserDefaults;
    self.isDraw = [self.userDefault boolForKey:@"isDraw"];
    self.nameColor = [[NSString alloc] initWithString:[self.userDefault stringForKey:@"nameColor"]];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Draw stories";
        self.switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 30)];
        [self.switchView setOn:self.isDraw];
        [self.switchView addTarget:self action:@selector(swichChangeValue) forControlEvents:UIControlEventValueChanged];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryView = self.switchView;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SettingCell"];
        cell.textLabel.text = @"Stroke color";
        cell.selectionStyle = UITableViewCellStyleSubtitle;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = self.nameColor;
        cell.detailTextLabel.textColor = [UIColor colorWithHexString:self.nameColor];
        NSLog(@"Cell name color %@", self.nameColor);
        return cell;
    }
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
}

@end

//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingColorViewController.h"
#import "SettingTableViewCell.h"
#import "UIColor+CustomColors.h"

@interface SettingColorViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *customColorsArrray;
@end

@implementation SettingColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeColorsArray];
    
    [self settingTableView];
    [self.table registerClass:SettingTableViewCell.class forCellReuseIdentifier: [SettingTableViewCell new].identifier];
    self.table.dataSource = self;
    self.table.delegate = self;
    
    NSLog(@"%@", self.customColorsArrray);
    [self.view addSubview:self.table];
    
    //self.view.backgroundColor = UIColor.whiteColor;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self settingNavBar];
}

-(void) makeColorsArray {
    self.customColorsArrray = [[NSArray alloc] initWithObjects: UIColor.whiteColor, nil];
    
}
//MARK: - Setting styles
-(void)settingTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.table.scrollEnabled = NO;
}

- (void)settingNavBar {
    [self.navigationController.navigationBar setTintColor:UIColor.blackColor];
}

//MARK: - Delegate and datasorse
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customColorsArrray.count;
}

@end

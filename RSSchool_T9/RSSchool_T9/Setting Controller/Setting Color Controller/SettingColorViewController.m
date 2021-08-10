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
#import "SettingViewController.h"

@interface SettingColorViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *customColorsArrray;
@property (nonatomic, strong) NSArray *customNameColorsArrray;
@property (nonatomic) NSInteger startIndex;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) SettingViewController *settingVC;
@end

@implementation SettingColorViewController
@synthesize colorDelegate;

- (void)getName:(NSString *)name {
    [self.colorDelegate colorName:name];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeColorsArray];
    
    [self settingTableView];
    
    self.settingVC = [[SettingViewController alloc] init];
    self.colorDelegate = self.settingVC;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.userDefaults = NSUserDefaults.standardUserDefaults;
    [self settingNavBar];
}

- (void) makeColorsArray {
    UIColor *clrbe2813 = [UIColor colorWithHexString:@"#be2813"];
    UIColor *clr3802da = [UIColor colorWithHexString:@"#3802da"];
    UIColor *clr467c24 = [UIColor colorWithHexString:@"#467c24"];
    UIColor *clr808080 = [UIColor colorWithHexString:@"#808080"];
    UIColor *clr8e5af7 = [UIColor colorWithHexString:@"#8e5af7"];
    UIColor *clrf07f5a = [UIColor colorWithHexString:@"#f07f5a"];
    UIColor *clrf3af22 = [UIColor colorWithHexString:@"#f3af22"];
    UIColor *clr3dacf7 = [UIColor colorWithHexString:@"#3dacf7"];
    UIColor *clre87aa4 = [UIColor colorWithHexString:@"#e87aa4"];
    UIColor *clr0f2e3f = [UIColor colorWithHexString:@"#0f2e3f"];
    UIColor *clr213711 = [UIColor colorWithHexString:@"#213711"];
    UIColor *clr511307 = [UIColor colorWithHexString:@"#511307"];
    UIColor *clr92003b = [UIColor colorWithHexString:@"#92003b"];
    
    self.customNameColorsArrray = [[NSArray alloc] initWithObjects:@"#be2813", @"#3802da", @"#467c24", @"#808080", @"#8e5af7", @"#f07f5a", @"#f3af22", @"#3dacf7", @"#e87aa4", @"#0f2e3f", @"#213711", @"#511307", @"#92003b",  nil];
    self.customColorsArrray = [[NSArray alloc] initWithObjects: clrbe2813, clr3802da, clr467c24, clr808080, clr8e5af7, clrf07f5a, clrf3af22, clr3dacf7, clre87aa4, clr0f2e3f, clr213711, clr511307, clr92003b, nil];
    
}
//MARK: - Setting styles
- (void)settingTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.table.scrollEnabled = YES;
    self.table.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.table];
    
    [self.table registerClass:UITableViewCell.class forCellReuseIdentifier: @"ColorCell"];
    self.table.dataSource = self;
    self.table.delegate = self;
    
    [self.table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
     [self.table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
      [self.table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
       [self.table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
}

- (void)settingNavBar {
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#be2813"]];
}

//MARK: - DataSource and delegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.customNameColorsArrray[indexPath.row];
    cell.textLabel.textColor = self.customColorsArrray[indexPath.row];
    cell.tintColor = self.customColorsArrray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if([self.customNameColorsArrray[indexPath.row] isEqual:[self.userDefaults stringForKey:@"nameColor"]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customColorsArrray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self getName:self.customNameColorsArrray[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

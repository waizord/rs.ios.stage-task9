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
@property (nonatomic, strong) NSArray *customNameColorsArrray;
@property (nonatomic) NSInteger startIndex;
@end

@implementation SettingColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeColorsArray];
    
    [self settingTableView];
    [self.table registerClass:SettingTableViewCell.class forCellReuseIdentifier: [SettingTableViewCell new].identifier];
    self.table.dataSource = self;
    self.table.delegate = self;
    
    //NSLog(@"%@", self.customColorsArrray);
    [self.view addSubview:self.table];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self settingNavBar];
}

-(void) makeColorsArray {
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
-(void)settingTableView {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.table.scrollEnabled = YES;
}

- (void)settingNavBar {
    [self.navigationController.navigationBar setTintColor: self.customColorsArrray[0]];
}

//MARK: - Delegate and datasorse
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SettingTableViewCell new].identifier forIndexPath:indexPath];
    cell = [[SettingTableViewCell new] configureRowWithName:self.customNameColorsArrray[indexPath.row] color:self.customColorsArrray[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customColorsArrray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

@end

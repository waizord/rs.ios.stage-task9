//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingTableViewCell.h"
#import "UIColor+CustomColors.h"

@implementation SettingTableViewCell

- (NSString *)identifier {
    return @"SettingTableViewCell";
}
- (NSString *)detailNameColor {
    NSString *detailNameColor = @"#f3af22";
    return detailNameColor;
}
- (UIColor *)detailColor {
    UIColor *detailColor = [UIColor colorWithHexString:@"#f3af22"];
    NSLog(@"%@", detailColor);
    return detailColor;
}

- (void)selectNameColor:(NSString *)name :(UIColor *)color {
    self.detailNameColor = name;
    self.detailColor = color;
    NSLog(@"%@, %@", self.detailNameColor, self.detailColor);
}

- (void) awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void) swichChangeValue {
    NSLog(@"%d", self.switchView.isOn);
    NSUserDefaults *userDefaults = NSUserDefaults.standardUserDefaults;
    [userDefaults setBool:self.switchView.isOn forKey:@"isDraw"];
}

- (UITableViewCell *) configureRow:(NSInteger)index isDraw:(BOOL)isDraw nameColor:(NSString *)nameColor {
    if (index == 0) {
        self.textLabel.text = @"Draw stories";
        self.switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 30)];
        [self.switchView setOn:isDraw];
        [self.switchView addTarget:self action:@selector(swichChangeValue) forControlEvents:UIControlEventValueChanged];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        return self;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.identifier];
        cell.textLabel.text = @"Stroke color";
        cell.selectionStyle = UITableViewCellStyleSubtitle;
        cell.detailTextLabel.text = self.detailNameColor;
        cell.detailTextLabel.textColor = self.detailColor;
//        cell.detailTextLabel.text = nameColor;
//        cell.detailTextLabel.textColor = color;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSLog(@"Cell");
        return cell;
    }
}

- (UITableViewCell *) configureRowWithName:(NSString *)nameColor color:(UIColor *)color {
    self.textLabel.text = nameColor;
    self.textLabel.textColor = color;
    self.tintColor = color;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if([nameColor isEqual:self.detailNameColor]) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return self;
}

@end

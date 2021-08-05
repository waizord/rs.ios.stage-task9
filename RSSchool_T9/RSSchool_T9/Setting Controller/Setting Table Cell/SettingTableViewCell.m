//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingTableViewCell.h"
#import "RSSchool_T9-Bridging-Header.h"
#import "UIColor+CustomColors.h"

@implementation SettingTableViewCell

- (NSString *)identifier {
    return @"SettingTableViewCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (UITableViewCell *) configureRow:(NSInteger)index isDraw:(BOOL)isDraw nameColor:(NSString *)nameColor {
    if (index == 0) {
        self.textLabel.text = @"Draw stories";
        self.switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 30)];
        [self.switchView setOn:isDraw];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        return self;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.identifier];
        //NSUserDefaults *userDefaults = NSUserDefaults.standardUserDefaults;
        //NSString *nameColor = [[NSString alloc] initWithString:[userDefaults stringForKey:@"nameColor"]];
        UIColor *color = [UIColor colorWithHexString:nameColor];
        cell.textLabel.text = @"Stroke color";
        cell.selectionStyle = UITableViewCellStyleSubtitle;
        cell.detailTextLabel.text = nameColor;
        cell.detailTextLabel.textColor = color;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

- (UITableViewCell *) configureRowWithName:(NSString *)nameColor color:(UIColor *)color {
    self.textLabel.text = nameColor;
    self.textLabel.textColor = color;
    self.tintColor = color;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

@end

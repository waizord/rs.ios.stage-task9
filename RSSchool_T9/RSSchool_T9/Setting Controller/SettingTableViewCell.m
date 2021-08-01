//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingTableViewCell.h"

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

-(void)configureRow: (NSInteger) index {
    
}

@end

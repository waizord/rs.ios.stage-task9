//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingTableViewCell : UITableViewCell
@property (strong, readonly) NSString *identifier;
@property (nonatomic) UISwitch *switchView;

//-(UITableViewCell *)configureRow: (NSInteger) index subTitle: (NSString *) string;
-(UITableViewCell *)configureRow: (NSInteger) index;
-(UITableViewCell *) configureRowWithName: (NSString *)nameColor color: (UIColor *)color;
@end

NS_ASSUME_NONNULL_END

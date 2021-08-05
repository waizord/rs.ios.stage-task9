//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "RSSchool_T9-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingTableViewCell : UITableViewCell
@property (strong, readonly) NSString *identifier;
@property (nonatomic) UISwitch *switchView;

- (UITableViewCell *) configureRow:(NSInteger)index isDraw:(BOOL)isDraw nameColor:(NSString *)nameColor;
- (UITableViewCell *) configureRowWithName:(NSString *)nameColor color:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END

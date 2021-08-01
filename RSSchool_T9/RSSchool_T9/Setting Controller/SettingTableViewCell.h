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
-(void)configureRow: (NSInteger) index;
@end

NS_ASSUME_NONNULL_END

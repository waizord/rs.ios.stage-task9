//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/3/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SettingColorViewController;
@protocol SettingViewControllerProtocol <NSObject>
@optional
- (void)selectNameColor:(NSString *)name :(UIColor *)color;
@end

NS_ASSUME_NONNULL_END

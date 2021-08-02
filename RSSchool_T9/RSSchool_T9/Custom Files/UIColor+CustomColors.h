//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CustomColors)
@property (nonatomic, strong) UIColor *BE2813;

+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length;

@end

NS_ASSUME_NONNULL_END

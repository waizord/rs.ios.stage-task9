//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "ColorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingColorViewController : UIViewController
@property (nonatomic, weak) id <ColorDelegate> colorDelegate;
@end

NS_ASSUME_NONNULL_END

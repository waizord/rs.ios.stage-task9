//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Ivan
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)
@dynamic BE2813;
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.BE2813 = UIColor.blackColor;
//    }
//    return self;
//}

+ (UIColor *)colorWithHexString:(NSString *)hex {
    NSString *colorString = [[hex stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    
    alpha = 1.0f;
    red = [self colorComponentFrom:colorString start:0 length:2];
    green = [self colorComponentFrom:colorString start:2 length:2];
    blue = [self colorComponentFrom:colorString start:4 length:2];
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length
{
    NSString *substr = [string substringWithRange: NSMakeRange(start, length)];
    NSString *hex = length == 2 ? substr : [NSString stringWithFormat: @"%@%@", substr, substr];
    unsigned hexComponent;
    [[NSScanner scannerWithString:hex] scanHexInt:&hexComponent];
    
    return hexComponent / 255.0;
}
@end

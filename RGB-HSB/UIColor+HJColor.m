//
//  UIColor+HJColor.m
//
//  Created by huangjian on 16/4/21.
//  Copyright © 2016年 huangjian. All rights reserved.
//

#import "UIColor+HJColor.h"

@implementation UIColor (HJColor)
+ (UIColor *)colorFromHexRGB:(NSString *)colorString alpha:(CGFloat)alpha;
{
    if ([colorString containsString:@"#"]) {
        colorString=[colorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != colorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:colorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:alpha];
    return result;
}
+ (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}
+ (NSMutableArray *)changeUIColorToRGB:(UIColor *)color
{
    NSMutableArray *RGBStrValueArr = [[NSMutableArray alloc] init];
    NSString *RGBStr = nil;
    
    //获得RGB值描述
    NSString *RGBValue = [NSString stringWithFormat:@"%@", color];
    
    //将RGB值描述分隔成字符串
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    
    //获取红色值
    float r = [RGBArr[1] floatValue];
    RGBStr = [NSString stringWithFormat:@"%.2lf", r];
    [RGBStrValueArr addObject:RGBStr];
    
    //获取绿色值
    float g = [RGBArr[2] floatValue];
    RGBStr = [NSString stringWithFormat:@"%.2lf", g];
    [RGBStrValueArr addObject:RGBStr];
    
    //获取蓝色值
    float b = [RGBArr[3] floatValue];
    RGBStr = [NSString stringWithFormat:@"%.2lf", b];
    [RGBStrValueArr addObject:RGBStr];
    
    float a = [RGBArr[4] floatValue];
    RGBStr = [NSString stringWithFormat:@"%.2lf", a];
    [RGBStrValueArr addObject:RGBStr];
    
    //返回保存RGB值的数组
    return RGBStrValueArr;
    
   
}
+ (NSString *)changeUIColorToRGBstr:(UIColor *)color
{
    NSString *RGBStr= nil;
    //获得RGB值描述
    NSString *RGBValue = [NSString stringWithFormat:@"%@", color];
    //将RGB值描述分隔成字符串
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    //获取红色值
    float r = [RGBArr[1] floatValue]*255.0;
    //获取绿色值
    float g = [RGBArr[2] floatValue]*255.0;
    //获取蓝色值
    float b = [RGBArr[3] floatValue]*255.0;
    float a = [RGBArr[4] floatValue];
    RGBStr = [NSString stringWithFormat:@"%.0f,%.0f,%.0f",ceilf(r),ceilf(g),ceilf(b)];
    
    return RGBStr;
}
+(void)colorToRgb
{
    CGFloat R, G, B;
    
    UIColor *uiColor = [UIColor redColor];
    CGColorRef color = [uiColor CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        R = components[0];
        G = components[1];
        B = components[2];
    }
}
@end

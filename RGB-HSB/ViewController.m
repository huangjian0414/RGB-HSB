//
//  ViewController.m
//  RGB-HSB
//
//  Created by 黄坚 on 2018/3/13.
//  Copyright © 2018年 黄坚. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HJColor.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *hsbTextField;
@property (weak, nonatomic) IBOutlet UILabel *rgbLabel;
@property (weak, nonatomic) IBOutlet UITextField *rgbTextField;
@property (weak, nonatomic) IBOutlet UILabel *hsbLabel;
@property (weak, nonatomic) IBOutlet UIView *hsbColorView;
@property (weak, nonatomic) IBOutlet UIView *rgbColorView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag==1) {
        [self dealWithHsbString:textField.text];
    }else if (textField.tag==2)
    {
        [self dealWithRgbString:textField.text];
    }
}
-(void)dealWithHsbString:(NSString *)str
{
    NSArray *array=[str componentsSeparatedByString:@"."];
    if (array.count!=3) {
        return;
    }
    UIColor *color=[UIColor colorWithHue:[array.firstObject floatValue]/360.0 saturation:[array[1] floatValue]/100.0 brightness:[array.lastObject floatValue]/100.0 alpha:1];
    self.rgbLabel.text= [UIColor changeUIColorToRGBstr:color];
    self.hsbColorView.backgroundColor=color;
}
-(void)dealWithRgbString:(NSString *)str
{
    CGFloat h,s,b,alpha;
    NSArray *array=[str componentsSeparatedByString:@"."];
    if (array.count!=3) {
        return;
    }
    UIColor *color=[UIColor colorWithRed:[array.firstObject floatValue]/255.0 green:[array[1] floatValue]/255.0 blue:[array.lastObject floatValue]/255.0 alpha:1];
    [color getHue:&h saturation:&s brightness:&b alpha:&alpha];
    self.hsbLabel.text=[NSString stringWithFormat:@"%.0f,%.0f,%.0f",ceilf(h*360.0),ceilf(s*100.0),ceilf(b*100.0)];
    self.rgbColorView.backgroundColor=color;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end

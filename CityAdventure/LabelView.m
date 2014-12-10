//
//  LabelView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/6.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "LabelView.h"
#import "AppDelegate.h"

@interface LabelView ()
@property (strong, nonatomic) UIImageView *icon;
@end
@implementation LabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_db"]];
        self.icon.frame = CGRectMake(10, 5, 16, 19);
        [self addSubview:self.icon];        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 200, 20)];
        self.label.textColor = [UIColor colorWithRed:0x33/255.0 green:0x66/255.0 blue:0xcc/255.0 alpha:1];
        [self.label setFont:[UIFont boldSystemFontOfSize:14]];
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        [self updateLabel:app.userInfo.placeName];
        [self addSubview:self.label];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)updateLabel:(NSString *)text
{
    self.label.text = text;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 196 / 255.0, 196 / 255.0, 196 / 255.0, 1);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    CGContextStrokePath(context);
    CGContextSetRGBStrokeColor(context, 0x33 / 255.0, 0x66 / 255.0, 0xcc / 255.0, 1);
    CGContextMoveToPoint(context, 5, 30);
    CGContextAddLineToPoint(context, self.frame.size.width - 5, 30);
    CGContextStrokePath(context);
}

@end

//
//  NextPlaceView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "NextPlaceView.h"
@interface NextPlaceView()
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *nextLabel;
@end
@implementation NextPlaceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_db"]];
        self.icon.frame = CGRectMake(10, 5, 16, 20);
        [self addSubview:self.icon];
        self.nextLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 200, 20)];
        self.nextLabel.text = @"下一站";
        self.nextLabel.textColor = [UIColor colorWithRed:0x33/255.0 green:0x66/255.0 blue:0xcc/255.0 alpha:1];
        [self.nextLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [self addSubview:self.nextLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 196 / 255.0, 196 / 255.0, 196 / 255.0, 1);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    CGContextMoveToPoint(context, 5, 30);
    CGContextAddLineToPoint(context, self.frame.size.width - 5, 30);
    CGContextStrokePath(context);
}

@end

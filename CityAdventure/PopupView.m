//
//  PopupView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/22.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "PopupView.h"
#import "MyControl.h"
@interface PopupView ()
@property (strong, nonatomic) MyTextView *contentView;
@end
@implementation PopupView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:0x33/255.0 green:0xcc/255.0 blue:0x99/255.0 alpha:1].CGColor;
    }
    return self;
}

- (void)updateContent:(NSString *)content
{
    self.contentView = [[MyTextView alloc]initWithFrame:CGRectMake(10, 40, self.frame.size.width - 20, self.frame.size.height - 50) andString:content];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 35)];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    self.titleLabel.backgroundColor = [UIColor colorWithRed:0x33/255.0 green:0xcc/255.0 blue:0x99/255.0 alpha:1];
    self.closeButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 60, 0, 40, 35)];
    [self.closeButton setTitle:@"×" forState:UIControlStateNormal];
    [self.closeButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentView];
    [self addSubview:self.closeButton];
}
@end

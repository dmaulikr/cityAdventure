//
//  ChangePlaceView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "ChangePlaceView.h"
@interface ChangePlaceView()

@end
@implementation ChangePlaceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.changePlaceIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
        self.changePlaceIndicator.center = CGPointMake(frame.size.width / 2, 30);
        [self addSubview:self.changePlaceIndicator];
        self.changePlaceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, 130, 40)];
        self.changePlaceLabel.textColor = [UIColor whiteColor];
        self.changePlaceLabel.font = [UIFont boldSystemFontOfSize:13];
        [self.changePlaceLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.changePlaceLabel];
        [self setBackgroundColor:[UIColor colorWithRed:0x11/255.0 green:0x11/255.0 blue:0x11/255.0 alpha:0.8]];
        self.layer.cornerRadius = 10;
    }
    return self;
}

@end

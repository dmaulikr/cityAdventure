//
//  PlaceView.m
//  FruitTrade
//
//  Created by 陈晓洁 on 14/11/2.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "PlaceView.h"
#import "AppDelegate.h"

@interface PlaceView ()
@property (strong, nonatomic) HintLabel*promptLabel;
@end
@implementation PlaceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeNames = [NSArray arrayWithObjects:@"上海火车站", @"人民广场", @"城隍庙", @"徐家汇", @"朱家角", @"崇明岛", nil];
        self.placeButtons = [[NSMutableArray alloc]init];
        NSInteger buttonLength = frame.size.width / 3;
        NSInteger buttonHeight = 40;
        NSInteger xOffset = 10;
        NSInteger yOffset = 0;
        self.currentIndex = 0;
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        for (int i = 0; i < 6; i++) {
            CGRect buttonPos = CGRectMake(xOffset + i % 3 * buttonLength, yOffset + i / 3 * buttonHeight, buttonLength, buttonHeight);
            UIButton *button = [[UIButton alloc]initWithFrame:buttonPos];
            [button setImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"pinhui"] forState:UIControlStateDisabled];
            [button setTitle:self.placeNames[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0x5e/255.0 green:0xc8/255.0 blue:0xff/255.0 alpha:1] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0x9b/255.0 green:0x94/255.0 blue:0x94/255.0 alpha:1] forState:UIControlStateDisabled];
            UIEdgeInsets edgeInset = button.titleEdgeInsets;
            edgeInset.left = 5;
            button.titleEdgeInsets = edgeInset;
            [button setTag:i];
            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
            [self.placeButtons addObject:button];
            [self addSubview:button];
            if ([app.userInfo.placeName isEqualToString:self.placeNames[i]]) {
                self.currentIndex = i;
            }
        }
        self.finishButton = [[FuctionalButton alloc]initWithFrame:CGRectMake(20, 10, frame.size.width - 40, 40)];
        [self.finishButton setTitle:@"上海雾霾严重，卷铺盖闪人" forState:UIControlStateNormal];
        self.finishButton.hidden = YES;
        [self addSubview:self.finishButton];
        self.promptLabel = [[HintLabel alloc]initWithFrame:CGRectMake(20, 60, frame.size.width - 40, 20)];
        self.promptLabel.text = @"最后一天，请清理仓库";
        self.promptLabel.textAlignment = NSTextAlignmentCenter;
        self.promptLabel.hidden = YES;
        [self addSubview:self.promptLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)goToLastDay:(BOOL)isLastDay
{
    if (isLastDay) {
        for (UIButton *btn in self.placeButtons) {
            btn.hidden = YES;
        }
        self.finishButton.hidden = NO;
        self.promptLabel.hidden = NO;
    }
    else
    {
        for (UIButton *btn in self.placeButtons) {
            btn.hidden = NO;
        }
        self.finishButton.hidden = YES;
        self.promptLabel.hidden = YES;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 196 / 255.0, 196 / 255.0, 196 / 255.0, 1);
    CGContextMoveToPoint(context, 0, 100);
    CGContextAddLineToPoint(context, self.frame.size.width, 100);
    CGContextStrokePath(context);
    if (self.finishButton.isHidden == YES) {
        CGContextSetRGBStrokeColor(context, 100/255.0, 200/255.0, 255.0/255.0, 1);
        CGContextMoveToPoint(context, 5, 40);
        CGContextAddLineToPoint(context, self.frame.size.width - 5, 40);
        CGContextMoveToPoint(context, 5, 80);
        CGContextAddLineToPoint(context, self.frame.size.width - 5, 80);
        CGContextStrokePath(context);
        CGContextMoveToPoint(context, self.frame.size.width / 3 - 5, 5);
        CGContextAddLineToPoint(context, self.frame.size.width / 3 - 5, 35);
        CGContextMoveToPoint(context, self.frame.size.width / 3 - 5, 45);
        CGContextAddLineToPoint(context, self.frame.size.width / 3 - 5, 75);
        CGContextMoveToPoint(context, 2 * self.frame.size.width / 3 - 5, 5);
        CGContextAddLineToPoint(context, 2 * self.frame.size.width / 3 - 5, 35);
        CGContextMoveToPoint(context, 2 * self.frame.size.width / 3 - 5, 45);
        CGContextAddLineToPoint(context, 2 * self.frame.size.width / 3 - 5, 75);
        CGContextStrokePath(context);
    }
}
@end

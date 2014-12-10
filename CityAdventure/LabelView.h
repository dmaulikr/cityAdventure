//
//  LabelView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/6.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelView : UIView
@property (strong, nonatomic) UILabel *label;
- (void)updateLabel:(NSString *)text;
@end

//
//  PopupView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/22.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupView : UIView
- (void)updateContent:(NSString *)content;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *closeButton;
@end

//
//  HintLabel.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/16.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
//提示文本
@interface HintLabel : UILabel
@end
//信息文本
@interface MainLabel : UILabel
@end
//设置界面按钮
@interface LabelLikeButton : UIButton
@property (strong, nonatomic) UIButton *rightButton;
@end
//功能性按钮
@interface FuctionalButton : UIButton
- (void)disableButton;
- (void)enableButton;
@end
//金钱文本
@interface MoneyLabel : UILabel
- (void)setMoney:(float)money;
@end

@interface MyTextView : UITextView
- (instancetype) initWithFrame:(CGRect)frame andString:(NSString *)str;
@end
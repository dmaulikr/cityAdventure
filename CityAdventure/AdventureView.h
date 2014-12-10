//
//  AdventureView.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/11.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDelegate.h"
#import "LabelView.h"
#import "MyControl.h"
@interface AdventureView : UIView
@property (strong, nonatomic) LabelView *labelView;
@property (strong, nonatomic) FuctionalButton *adventureButton;
@property (assign, nonatomic) NSString *adventureEvent;
@end

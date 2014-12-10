//
//  AppDelegate.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) BOOL hasLoadData;
@property (strong, nonatomic) UserInfo *userInfo;
@end


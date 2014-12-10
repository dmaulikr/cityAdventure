//
//  AppDelegate.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.hasLoadData = YES;
    self.userInfo = [[UserInfo alloc]init];
    [self.userInfo getData];
    ViewController *controller = (ViewController *)self.window.rootViewController;
    [controller getData];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.userInfo saveData];
    self.hasLoadData = NO;
    ViewController *controller = (ViewController *)self.window.rootViewController;
    [controller saveData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    if (!self.hasLoadData) {
        [self.userInfo getData];
        self.hasLoadData = YES;
        ViewController *controller = (ViewController *)self.window.rootViewController;
        [controller getData];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if (!self.hasLoadData) {
        self.hasLoadData = YES;
        [self.userInfo getData];
        ViewController *controller = (ViewController *)self.window.rootViewController;
        [controller getData];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    self.hasLoadData = NO;
    [self.userInfo saveData];
    ViewController *controller = (ViewController *)self.window.rootViewController;
    [controller saveData];
}

- (void)dealloc
{
    
}

@end

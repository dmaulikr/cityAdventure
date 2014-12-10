//
//  ViewController.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "SettingView.h"
#import "IntroduceView.h"
#import "AppDelegate.h"
#import "AchieveView.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController ()<UIAlertViewDelegate, MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) MainView *mainView;
@property (strong, nonatomic) SettingView *mySetting;
@property (strong, nonatomic) IntroduceView *introduceView;
@property (strong, nonatomic) AchieveView *achieveView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mainView = [[MainView alloc]initWithFrame:self.view.frame];
    [self.mainView.mainHeadView.settingButton addTarget:self action:@selector(goToSettings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mainView];
    self.mySetting = [[SettingView alloc]initWithFrame:self.view.frame];
    self.mySetting.hidden = YES;
    [self.mySetting.headView.backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.introduceButton addTarget:self action:@selector(showIntroduce) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.introduceButton.rightButton addTarget:self action:@selector(showIntroduce) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.achieveButton addTarget:self action:@selector(showAchieve) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.achieveButton.rightButton addTarget:self action:@selector(showAchieve) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.restartButton addTarget:self action:@selector(comfirmRestart) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.adviseButton addTarget:self action:@selector(sendAdvise) forControlEvents:UIControlEventTouchUpInside];
    [self.mySetting.adviseButton.rightButton addTarget:self action:@selector(sendAdvise) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mySetting];

    self.introduceView = [[IntroduceView alloc]initWithFrame:self.view.frame];
    self.introduceView.hidden = YES;
    [self.introduceView.headView.backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.introduceView];
    [self.view setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1]];  
}
#pragma setting
- (void)goToSettings
{
    self.mainView.hidden = YES;
    self.mySetting.hidden = NO;
    [self viewTransition:1];
}
//意见反馈
- (void)sendAdvise
{
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    if (controller == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"设备还没有添加邮件账户" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [controller setSubject:@"意见反馈"];
        [controller setToRecipients:[NSArray arrayWithObject:@"system@xiangjf.com"]];
        [controller setMessageBody:@"" isHTML:NO];
        controller.mailComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
        {UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"发送成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            break;}
            
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
//游戏介绍
- (void)showIntroduce
{
    self.introduceView.hidden = NO;
    self.mySetting.hidden = YES;
    [self viewTransition:3];
}
//游戏成就
- (void)showAchieve
{
    if (self.achieveView == nil) {
        self.achieveView = [[AchieveView alloc]initWithFrame:self.view.frame];
        [self.achieveView.headView.backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [self.achieveView updateView];
        self.achieveView.hidden = NO;
        [self.achieveView setNeedsDisplay];
    }
    [self.view addSubview:self.achieveView];
    self.mySetting.hidden = YES;
    [self viewTransition:5];
}
- (void)comfirmRestart
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"确定要重新开始游戏吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    [self.mySetting.restartButton setBackgroundColor:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1]];
}
- (void)restart
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"username"];
    [defaults removeObjectForKey:@"itemPrices"];
    [defaults synchronize];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.userInfo restart];
    [self.mainView.itemsView.itemsTableView getData];
    self.mainView.hidden = NO;
    self.mySetting.hidden = YES;
    [self.mainView.statusView setStatusControlValue];
    [self.mainView.mainHeadView updateDayButton:app.userInfo.pastDay];
    [self.mainView.mainFuctionView.labelView updateLabel:app.userInfo.placeName];
    [self.mainView.placeView goToLastDay:NO];
    [(UIButton *)self.mainView.placeView.placeButtons[self.mainView.placeView.currentIndex] setEnabled:YES];
    [(UIButton *)self.mainView.placeView.placeButtons[0] setEnabled:NO];
    self.mainView.placeView.currentIndex = 0;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self restart];
    }
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
}

//点击返回按钮
- (void)backButtonClick
{
    if (self.introduceView.isHidden == NO) {
        [self viewTransition:4];
        self.introduceView.hidden = YES;
        self.mySetting.hidden = NO;
        return;
    }
    if (self.achieveView.isHidden == NO && self.achieveView != nil) {
        [self viewTransition:6];
        self.achieveView.hidden = YES;
        self.mySetting.hidden = NO;
        return;
    }
    if (self.mySetting.isHidden == NO) {
        self.mySetting.hidden = YES;
        self.mainView.hidden = NO;
        [self viewTransition:2];
        return;
    }
}

//1，2显示关闭设置 3，4显示关闭介绍 5，6显示关闭成就
- (void)viewTransition:(NSInteger)type
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.4;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.delegate = self;
    transition.type = kCATransitionPush;
    transition.removedOnCompletion = YES;
    switch (type) {
        case 1:
            transition.subtype = kCATransitionFromRight;
            [self.mySetting.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainView.layer addAnimation:transition forKey:nil];
            break;
        case 2:
            transition.subtype = kCATransitionFromLeft;
            [self.mainView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mySetting.layer addAnimation:transition forKey:nil];
            break;
        case 3:
            transition.subtype = kCATransitionFromRight;
            [self.introduceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mySetting.layer addAnimation:transition forKey:nil];
            break;
        case 4:
            transition.subtype = kCATransitionFromLeft;
            [self.mySetting.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.introduceView.layer addAnimation:transition forKey:nil];
            break;
        case 5:
            transition.subtype = kCATransitionFromRight;
            [self.achieveView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mySetting.layer addAnimation:transition forKey:nil];
            break;
        case 6:
            transition.subtype = kCATransitionFromLeft;
            [self.mySetting.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.achieveView.layer addAnimation:transition forKey:nil];
            break;
        default:
            break;
    }
}
- (void)getData
{
    [self.mainView.itemsView.itemsTableView getData];
}
- (void)saveData
{
    [self.mainView.itemsView.itemsTableView saveData];
}
@end

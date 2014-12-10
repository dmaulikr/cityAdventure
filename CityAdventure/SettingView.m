//
//  SettingView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/19.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "SettingView.h"

@interface SettingView()<UIAlertViewDelegate>

@property (strong, nonatomic) UIImageView *programImage;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) LabelLikeButton *versionButton;
@property (strong, nonatomic) LabelLikeButton *aboutButton;

@property (strong, nonatomic) LabelLikeButton *scoreButton;
@property (strong, nonatomic) HintLabel *copyrightLabel;
@end
@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 64) andType:2];
        [self addSubview:self.headView];
        UIImage *image = [UIImage imageNamed:@"120"];
        self.programImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 - image.size.width / 2, 90, image.size.width, image.size.height)];
        self.programImage.image = image;
        [self addSubview:self.programImage];
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, image.size.height + 125, self.frame.size.width, 25)];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:14];
        self.nameLabel.textColor = [UIColor blackColor];
        [self.nameLabel setText:@"魔都历险记"];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.nameLabel];
        self.introduceButton = [[LabelLikeButton alloc]initWithFrame:CGRectMake(0, 190, self.frame.size.width, 40)];
        [self.introduceButton setTitle:@"游戏介绍" forState:UIControlStateNormal];
        self.introduceButton.tag = 1;
        self.introduceButton.rightButton.tag = 1;
        [self.introduceButton.rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.introduceButton];
        self.achieveButton = [[LabelLikeButton alloc]initWithFrame:CGRectMake(0, 230, self.frame.size.width, 40)];
        [self.achieveButton setTitle:@"我的成就" forState:UIControlStateNormal];
        self.achieveButton.tag = 2;
        self.achieveButton.rightButton.tag = 2;
        [self.achieveButton.rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.achieveButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.achieveButton];
        self.restartButton = [[FuctionalButton alloc]initWithFrame:CGRectMake(10, 285, self.frame.size.width - 20, 35)];
        [self.restartButton setTitle:@"重新开始" forState:UIControlStateNormal];
        self.restartButton.tag = 3;
        [self addSubview:self.restartButton];
        self.versionButton = [[LabelLikeButton alloc]initWithFrame:CGRectMake(0, 335, self.frame.size.width, 40)];
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
        [self.versionButton setTitle:[NSString stringWithFormat:@"版本信息(v%@)", appVersion] forState:UIControlStateNormal];
        self.versionButton.tag = 4;
        self.versionButton.rightButton.tag = 4;
        [self.versionButton.rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.versionButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.versionButton];
        self.aboutButton = [[LabelLikeButton alloc]initWithFrame:CGRectMake(0, 375, self.frame.size.width, 40)];
        [self.aboutButton setTitle:@"关于我们" forState:UIControlStateNormal];
        self.aboutButton.tag = 5;
        self.aboutButton.rightButton.tag = 5;
        [self.aboutButton.rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.aboutButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.aboutButton];
        self.adviseButton = [[LabelLikeButton alloc]initWithFrame:CGRectMake(0, 415, self.frame.size.width, 40)];
        [self.adviseButton setTitle:@"意见反馈" forState:UIControlStateNormal];
        self.adviseButton.tag = 6;
        self.adviseButton.rightButton.tag = 6;
        [self.adviseButton.rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.adviseButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.adviseButton];
//        self.scoreButton = [[LabelLikeButton alloc]initWithFrame:CGRectMake(0, 455, self.frame.size.width, 40)];
//        [self.scoreButton setTitle:@"给我们打分吧" forState:UIControlStateNormal];
//        self.scoreButton.tag = 7;
//        self.scoreButton.rightButton.tag = 7;
//        [self.scoreButton.rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self.scoreButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.scoreButton];
        
        self.copyrightLabel = [[HintLabel alloc]initWithFrame:CGRectMake(15, frame.size.height - 50, frame.size.width - 30, 30)];
        self.copyrightLabel.text = @"Copyright (c) 2014 Fiona. All rights reserved.";
        self.copyrightLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.copyrightLabel];
        self.backgroundColor = [UIColor colorWithRed:0xee/255.0 green:0xee/255.0 blue:0xee/255.0 alpha:1];
    }
    return self;
}

- (void)buttonClicked:(UIButton *)button
{
    switch (button.tag) {
        case 4:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"当前版本已经是最新版本" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
//            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://itunes.apple.com/search?term=魔都历险记&entity=software"]];
//            [request setHTTPMethod:@"POST"];
//            NSError *error = nil;
//            NSHTTPURLResponse *response = nil;
//            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//            if (error.code == 0) {
//                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
//                NSArray *resultArray = [result objectForKey:@"results"];
//                if (resultArray.count != 0) {
//                    NSDictionary *info = resultArray[0];
//                    NSString *latestVersion = [info objectForKey:@"version"];
//                    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
//                    NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
//                    if ([latestVersion isEqualToString:appVersion]) {
//                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"更新" message:@"此版本为最新版本" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//                        [alert show];
//                    } else {
//                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"更新" message:@"有新的版本更新，是否前往更新？" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:@"更新", nil];
//                        alert.tag = 100;
//                        [alert show];
//                    }
//                }
//            } else {
//                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:error.description delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [alert show];
//            }
            break;
        }
//        case 7:
//        {
//            NSString *str = [NSString stringWithFormat:
//                             @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=53445433"];
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//            break;
//        }
        default:
        {
            break;
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    if (buttonIndex == 1) {
//        if (alertView.tag == 100)
//        {
//            NSString *iTunesLink = @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=284417350&mt=8";
//            
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
//        }
//    }
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
}
@end

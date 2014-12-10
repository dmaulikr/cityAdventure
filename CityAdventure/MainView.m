//
//  MainView.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/20.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//
#import "AppDelegate.h"
#import "MainView.h"
#import "NextPlaceView.h"
#import "ChangePlaceView.h"
#import "SellBuyView.h"
#import "AdventureView.h"
#import "DepositView.h"
#import "BankView.h"
#import "HoapitalView.h"
#import "StorageView.h"
#import "PopupView.h"
#import "ResultView.h"

@interface MainView()<TradeDelegate, FuctionDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) NextPlaceView *nextPlaceView; //下一站视图
@property (strong, nonatomic) ChangePlaceView *changePlaceView; //切换地点显示的动画视图
@property (strong, nonatomic) SellBuyView *tradeView; //交易视图
@property (strong, nonatomic) UIView *extraView; //交易时显示的半透明图层
@property (strong, nonatomic) AdventureView *adventureView; //探险视图
@property (strong, nonatomic) DepositView *depositView; //余X宝视图
@property (strong, nonatomic) BankView *bankView; //银行视图
@property (strong, nonatomic) HoapitalView *hospitalView; //医院视图
@property (strong, nonatomic) StorageView *storageView; //仓库租赁视图
@property (strong, nonatomic) PopupView *popupView;
@property (strong, nonatomic) ResultView *resultView;
@property (strong, nonatomic) AppDelegate *app;
@property (strong, nonatomic) NSMutableString *dayString;
@property (assign, nonatomic) NSInteger goodEventType;
@end
@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mainHeadView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 64) andType:1];
        [self.mainHeadView.backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.mainHeadView];
        self.statusView = [[StatusView alloc]initWithFrame:CGRectMake(0, 64, frame.size.width, 120)];
        [self addSubview:self.statusView];
        self.mainFuctionView = [[MainFuctionView alloc]initWithFrame:CGRectMake(0, 194, frame.size.width, 226)];
        [self addSubview:self.mainFuctionView];
        self.nextPlaceView = [[NextPlaceView alloc]initWithFrame:CGRectMake(0, 430, frame.size.width, 36)];
        [self addSubview:self.nextPlaceView];
        self.placeView = [[PlaceView alloc]initWithFrame:CGRectMake(0, 466, frame.size.width, 100)];
        [self.placeView.finishButton addTarget:self action:@selector(confirmFinish) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.placeView];
        [(UIButton *)self.placeView.placeButtons[self.placeView.currentIndex] setEnabled:NO];
        [self.statusView setStatusControlValue];
         CGRect fuctionRect = CGRectMake(0, 194, frame.size.width, frame.size.height - 194);
        self.adventureView = [[AdventureView alloc]initWithFrame:fuctionRect];
        self.adventureView.hidden = YES;
        [self.adventureView.adventureButton addTarget:self action:@selector(goAdventure) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.adventureView];
        //地点按钮
        for (UIButton *btn in self.placeView.placeButtons) {
            [btn addTarget:self action:@selector(changePlace:) forControlEvents:UIControlEventTouchUpInside];
        }
        for (UIButton *btn in self.mainFuctionView.fuctionButtons) {
            [btn addTarget:self action:@selector(fuctionSelected:) forControlEvents:UIControlEventTouchUpInside];
        }
        self.changePlaceView = [[ChangePlaceView alloc]initWithFrame:CGRectMake(frame.size.width / 2 - 65, 240, 130, 90)];
        self.changePlaceView.hidden = YES;
        [self addSubview:self.changePlaceView];
        self.itemsView = [[ItemsView alloc]initWithFrame:fuctionRect];
        self.itemsView.hidden = YES;
        self.itemsView.delegate = self;
        [self addSubview:self.itemsView];
        self.depositView = [[DepositView alloc]initWithFrame:fuctionRect];
        self.depositView.hidden = YES;
        self.depositView.delegate = self;
        [self addSubview:self.depositView];
        self.bankView = [[BankView alloc]initWithFrame:fuctionRect];
        self.bankView.hidden = YES;
        self.bankView.delegate = self;
        [self addSubview:self.bankView];
        self.hospitalView = [[HoapitalView alloc]initWithFrame:fuctionRect];
        self.hospitalView.hidden = YES;
        [self.hospitalView.confirmButton addTarget:self action:@selector(hospitalTreat) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.hospitalView];
        self.storageView = [[StorageView alloc]initWithFrame:fuctionRect];
        self.storageView.hidden = YES;
        [self.storageView.confirmButton addTarget:self action:@selector(rentStorage) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.storageView];
        self.extraView = [[UIView alloc]initWithFrame:self.frame];
        self.extraView.hidden = YES;
        self.extraView.backgroundColor = [UIColor colorWithRed:0x11/255.0 green:0x11/255.0 blue:0x11/255.0 alpha:1];
        self.extraView.alpha = 0.5;
        [self addSubview:self.extraView];
        self.popupView = [[PopupView alloc]initWithFrame:CGRectMake(15, 170, self.frame.size.width - 30, 250)];
        self.popupView.hidden = YES;
        [self addSubview:self.popupView];
        self.tradeView = [[SellBuyView alloc]initWithFrame:CGRectMake(frame.size.width / 2 - 120, 190, 240, 240)];
        self.tradeView.hidden = YES;
        self.tradeView.delegate = self;
        [self addSubview:self.tradeView];
        self.app = [UIApplication sharedApplication].delegate;
        self.mainFuctionView.backgroundView.image = [UIImage imageNamed:[NSString stringWithFormat:@"area%ld", (long)self.placeView.currentIndex + 1]];
        self.dayString = [[NSMutableString alloc]init];
    }
    return self;
}
#pragma change place
//去别的地方
- (void)changePlace:(UIButton *)button
{
    if (button.tag == self.placeView.currentIndex) {
        return;
    }
    [(UIButton *)self.placeView.placeButtons[self.placeView.currentIndex] setEnabled:YES];
    self.placeView.currentIndex = button.tag;
    [(UIButton *)self.placeView.placeButtons[self.placeView.currentIndex] setEnabled:NO];
    self.app.userInfo.placeName = self.placeView.placeNames[self.placeView.currentIndex];
    self.changePlaceView.hidden = NO;
    self.userInteractionEnabled = NO;
    [self.changePlaceView.changePlaceIndicator startAnimating];
    self.changePlaceView.changePlaceLabel.text = [NSString stringWithFormat:@"正在前往%@", self.placeView.placeNames[self.placeView.currentIndex]];
    [self performSelector:@selector(anotherDay) withObject:self afterDelay:1];
}
- (void)confirmFinish
{
    if (self.app.userInfo.usedStorage != 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"您的仓库还未清理完毕，请先去集市出售商品。" delegate:self cancelButtonTitle:@"不去" otherButtonTitles:@"好的", nil];
        alert.tag = 10;
        [alert show];
    }
    else
    {
        [self finishGame];
    }
}
- (void)finishGame
{
    [self.placeView.finishButton setBackgroundColor:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1]];
    self.resultView = [[ResultView alloc]initWithFrame:self.frame];
    [self.resultView.restartButton addTarget:self action:@selector(comfirmRestart) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.resultView];    
}
- (void)comfirmRestart
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"确定要重新开始游戏吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    [self.resultView.restartButton setBackgroundColor:[UIColor colorWithRed:0xff/255.0 green:0x44/255.0 blue:0x51/255.0 alpha:1]];
}
- (void)restart
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"username"];
    [defaults removeObjectForKey:@"itemPrices"];
    [defaults synchronize];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.userInfo restart];
    [self.itemsView.itemsTableView getData];
    self.hidden = NO;
    [self.resultView removeFromSuperview];
    [self.statusView setStatusControlValue];
    [self.mainHeadView updateDayButton:app.userInfo.pastDay];
    [self.mainFuctionView.labelView updateLabel:app.userInfo.placeName];
    [self.placeView goToLastDay:NO];
    [(UIButton *)self.placeView.placeButtons[self.placeView.currentIndex] setEnabled:YES];
    [(UIButton *)self.placeView.placeButtons[0] setEnabled:NO];
    self.placeView.currentIndex = 0;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        if (alertView.tag != 10) {
            [self restart];
        }
        

    }
    else if (buttonIndex == 0) {
        if (alertView.tag == 10) {
            [self finishGame];
        }
    }
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    [alertView removeFromSuperview];
}
- (void)anotherDay
{
    self.dayString.string = @"";
    [self.changePlaceView.changePlaceIndicator stopAnimating];
    self.changePlaceView.hidden = YES;
    self.userInteractionEnabled = YES;
    self.app.userInfo.pastDay++;
    [self.mainHeadView updateDayButton:self.app.userInfo.pastDay];
    [self.mainFuctionView.labelView updateLabel:self.placeView.placeNames[self.placeView.currentIndex]];
    self.mainFuctionView.backgroundView.image = [UIImage imageNamed:[NSString stringWithFormat:@"area%ld", (long)self.placeView.currentIndex + 1]];
    [self.app.userInfo changeDay];
    BOOL beaten = NO;
    if (self.app.userInfo.debt > 50000) {
        beaten = [self beBeaten];
        if (beaten) {
            self.app.userInfo.health -= 10;
            if (self.app.userInfo.health < 0) {
                self.app.userInfo.health = 0;
            }
        }
    }
    if (beaten) {
        [self.dayString insertString:@"1，因为欠债太多，被讨债的狠狠揍了一顿，损失10点健康！" atIndex:0];
    }
    [self getAdventureEvent];
    [self getGoodsEvent];
    if (beaten) {
        [self.dayString insertString:[NSString stringWithFormat:@"\n3，%@", self.adventureView.adventureEvent] atIndex:self.dayString.length];
    }
    else
    {
        [self.dayString insertString:[NSString stringWithFormat:@"\n2，%@", self.adventureView.adventureEvent] atIndex:self.dayString.length];
    }
    self.popupView.hidden = NO;
    self.extraView.hidden = NO;
    [self.popupView updateContent:self.dayString];
    [self.popupView.closeButton addTarget:self action:@selector(closePopup) forControlEvents:UIControlEventTouchUpInside];

    self.popupView.titleLabel.text = [NSString stringWithFormat:@"第 %ld 天", (long)self.app.userInfo.pastDay];
    [self.statusView setStatusControlValue];
    if (self.app.userInfo.pastDay == 30) {
        [self.placeView goToLastDay:YES];
    }
}
//是否被打
- (BOOL)beBeaten
{
    NSInteger result = 0;
    result = arc4random() % 100;
    if (result >= 50) {
        return YES;
    } else {
        return NO;
    }
}
#pragma fuction
- (void)fuctionSelected:(UIButton *)button
{
    self.mainFuctionView.hidden = YES;
    self.placeView.hidden = YES;
    self.nextPlaceView.hidden = YES;
    self.mainHeadView.backButton.hidden = NO;
    self.mainHeadView.settingButton.hidden = YES;
    switch (button.tag) {
        case 1:
            [self viewTransition:1];
            self.itemsView.hidden = NO;
            if (self.app.userInfo.lastUpdateDay != self.app.userInfo.pastDay) {
                self.app.userInfo.lastUpdateDay = self.app.userInfo.pastDay;
                [self.itemsView.itemsTableView getItems:self.goodEventType];
                [self.itemsView.itemsTableView reloadData];
            }
            break;
        case 2:
            [self viewTransition:5];
            self.depositView.inputField.text = @"";
            self.depositView.alertLabel.hidden = YES;
            self.depositView.segControl.selectedSegmentIndex = 0;
            self.depositView.currentCash = self.app.userInfo.cash;
            self.depositView.currentDeposit = self.app.userInfo.deposit;
            self.depositView.hidden = NO;
            [self.depositView.confirmButton disableButton];
            break;
        case 3:
            [self viewTransition:7];
            self.bankView.currentDebt = self.app.userInfo.debt;
            self.bankView.currentCash = self.app.userInfo.cash;
            self.bankView.currentDeposit = self.app.userInfo.deposit;
            [self.bankView updateView];
            self.bankView.hidden = NO;
            break;
        case 4:
            [self viewTransition:9];
            NSInteger needHealth = 100 - [self.statusView.healthLabel.text integerValue];
            self.hospitalView.needHealth = needHealth;
            self.hospitalView.segControl.selectedSegmentIndex = 0;
            self.hospitalView.healthMoney = needHealth * 2000;
            self.hospitalView.currentCash = self.app.userInfo.cash;
            self.hospitalView.currentDeposit = self.app.userInfo.deposit;
            if (self.app.userInfo.pastDay == 30) {
                self.hospitalView.isLastDay = YES;
            } else {
                self.hospitalView.isLastDay = NO;
            }
            [self.hospitalView updateView];
            self.hospitalView.hidden = NO;
            break;
        case 5:
            [self viewTransition:11];
            self.storageView.rentCount = self.app.userInfo.rentStorage;
            self.storageView.currentCash = self.app.userInfo.cash;
            self.storageView.currentDeposit = self.app.userInfo.deposit;
            [self.storageView updateView];
            self.storageView.hidden = NO;
            break;
        case 6:
            self.adventureView.hidden = NO;
            if (self.app.userInfo.power < 5) {
                [self.adventureView.adventureButton disableButton];
            }
            else
            {
                [self.adventureView.adventureButton enableButton];
            }
            [self viewTransition:13];
            break;
        default:
            break;
    }
}
//余X宝转入转出
- (void)operateDeposit
{
    if (self.depositView.segControl.selectedSegmentIndex == 0) {
        self.app.userInfo.cash -= self.depositView.transferMoney;
        self.app.userInfo.deposit += self.depositView.transferMoney;
    } else {
        self.app.userInfo.cash += self.depositView.transferMoney;
        self.app.userInfo.deposit -= self.depositView.transferMoney;
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"转账成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [self.statusView setStatusControlValue];
    [self backButtonClicked];
}
//还清贷款
- (void)payDebt
{
    if (self.app.userInfo.debt > self.app.userInfo.cash) {
        self.app.userInfo.deposit -= (self.app.userInfo.debt - self.app.userInfo.cash);
        self.app.userInfo.cash = 0;
    } else {
        self.app.userInfo.cash -= self.app.userInfo.debt;
    }
    self.app.userInfo.debt = 0;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"还款成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [self backButtonClicked];
    [self.statusView setStatusControlValue];
}
//医院治疗
- (void)hospitalTreat
{
    if (self.hospitalView.healthMoney > self.app.userInfo.cash){
        self.app.userInfo.deposit -= (self.hospitalView.healthMoney - self.app.userInfo.cash);
        self.app.userInfo.cash = 0;
    } else {
        self.app.userInfo.cash -= self.hospitalView.healthMoney;
    }
    self.app.userInfo.health = 100;
    if (self.hospitalView.segControl.selectedSegmentIndex == 0) {
        self.app.userInfo.pastDay++;
        [self.mainHeadView updateDayButton:self.app.userInfo.pastDay];
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"恭喜" message:@"经过治疗，您已经恢复到完美的健康状态！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [self backButtonClicked];
    [self.statusView setStatusControlValue];
}
//仓库租借
- (void)rentStorage
{
    if (self.storageView.rentMoney > self.app.userInfo.cash)
    {
        self.app.userInfo.deposit -= (self.storageView.rentMoney - self.app.userInfo.cash);
        self.app.userInfo.cash = 0;
    } else {
        self.app.userInfo.cash -= self.storageView.rentMoney;
    }
    self.app.userInfo.rentStorage += 1;
    self.app.userInfo.totalStorage += 10;
    self.app.userInfo.houseValue += self.storageView.rentMoney;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"购买成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    self.storageView.rentCount += 1;
    self.storageView.currentCash = self.app.userInfo.cash;
    self.storageView.currentDeposit = self.app.userInfo.deposit;
    [self.storageView updateView];
    [self.statusView setStatusControlValue];
}
//进行探险
- (void)goAdventure
{
    self.changePlaceView.hidden = NO;
    self.userInteractionEnabled = NO;
    [self.changePlaceView.changePlaceIndicator startAnimating];
    self.app.userInfo.power -= 5;
    self.changePlaceView.changePlaceLabel.text = @"探险中。。。";
    [self performSelector:@selector(getAdventureEvent) withObject:self afterDelay:1];
}
- (void)getAdventureEvent
{
    [self.changePlaceView.changePlaceIndicator stopAnimating];
    self.changePlaceView.hidden = YES;
    self.userInteractionEnabled = YES;
    if (self.app.userInfo.power < 5) {
        [self.adventureView.adventureButton disableButton];
    }
    else
    {
        [self.adventureView.adventureButton enableButton];
    }
    NSInteger max = 9;
    BOOL hasCash = NO;
    BOOL hasPhone = NO;
    BOOL hasDiamond = NO;
    if (self.app.userInfo.cash > 5000) {
        max += 1;
        hasCash = YES;
    }
    //有钻石
    if ([self.itemsView.itemsTableView.boughtItems[4] integerValue] >= 1) {
        max += 5;
        hasDiamond = YES;
    }
    //有手机
    if ([self.itemsView.itemsTableView.boughtItems[6] integerValue] >= 1) {
        max += 5;
        hasPhone = YES;
    }
    NSInteger event = 0;
    event = arc4random() % max + 1;
    NSString *str = @"";
    float changeValue = 0.f;
    if (hasCash && event == 10) {
        changeValue = arc4random() % 3 + 1;
        str = [NSString stringWithFormat:@"在魔都老街，花费5000元，淘到%.0f件古玩。", changeValue];
        self.itemsView.itemsTableView.boughtItems[2] = [NSNumber numberWithInteger:[self.itemsView.itemsTableView.boughtItems[2] integerValue] + (NSInteger)changeValue];
        self.app.userInfo.usedStorage += (NSInteger)changeValue;
        self.app.userInfo.cash -= 5000;
    }
    else if((hasCash && event >= 11 && event <= 15) || (!hasCash && event >= 10 && event <= 14))
    {
        if (hasDiamond) {
            changeValue = [self.itemsView.itemsTableView.boughtItems[4] integerValue] * 0.2;
            changeValue = (NSInteger)changeValue + 1;
            str = [NSString stringWithFormat:@"向路人炫耀钻石，俗话说的好“不怕贼偷就怕贼惦记”，损失%.0f颗钻石。", changeValue];
            self.itemsView.itemsTableView.boughtItems[4] = [NSNumber numberWithInteger:[self.itemsView.itemsTableView.boughtItems[4] integerValue] - (NSInteger)changeValue];
            self.app.userInfo.usedStorage -= (NSInteger)changeValue;
        }
        else if (hasPhone)
        {
            str = @"挤公交车，挤掉1部水果手机。";
            self.itemsView.itemsTableView.boughtItems[6] = [NSNumber numberWithInteger:[self.itemsView.itemsTableView.boughtItems[6] integerValue] - 1];
            self.app.userInfo.usedStorage -= 1;
        }
    }
    else if(event >= 16 && event <= 20)
    {
        str = @"挤公交车，挤掉1部水果手机。";
        self.itemsView.itemsTableView.boughtItems[6] = [NSNumber numberWithInteger:[self.itemsView.itemsTableView.boughtItems[6] integerValue] - 1];
        self.app.userInfo.usedStorage -= 1;
    }
    switch (event) {
        case 1:
            changeValue = self.app.userInfo.cash / 2;
            if (changeValue > 10000) {
                changeValue = 10000;
            }
            self.app.userInfo.cash -= changeValue;
            self.app.userInfo.reputation += 5;
            str = [NSString stringWithFormat:@"搀扶过马路摔倒的老奶奶，声望加5，却垫付了%.2f元医药费。", changeValue];
            break;
        case 2:
            str = @"热心接待远道而来的朋友，朋友送我1部水果手机";
            self.itemsView.itemsTableView.boughtItems[6] = [NSNumber numberWithInteger:[self.itemsView.itemsTableView.boughtItems[6] integerValue] + 1];
            self.app.userInfo.usedStorage += 1;
            break;
        case 3:
            str = @"积极参加体育锻炼，身体键康，健康+5。";
            self.app.userInfo.health += 5;
            if (self.app.userInfo.health > 100) {
                self.app.userInfo.health = 100;
            }
            break;
        case 4:
            str = @"现金用来炒房产，获得20%收益。";
            self.app.userInfo.cash *= 1.2;
            break;
        case 5:
            str = @"乘坐地铁地被两个大汉挤了一下，损失现金20%";
            self.app.userInfo.cash *= 0.8;
            break;
        case 6:
            str = @"网上冲浪时，勿进入钓鱼网站，余X宝被盗，损失30%存款。";
            self.app.userInfo.deposit *= 0.7;
            break;
        case 7:
            str = @"发现余X宝漏洞，修改存款金额。余X宝金额增加30%。";
            self.app.userInfo.deposit *= 1.3;
            break;
        case 8:
            str = @"意气风发，购买彩票中大奖，获得奖金3000元。";
            self.app.userInfo.cash += 3000;
            break;
        case 9:
            changeValue = arc4random() % 3 + 1;
            str = [NSString stringWithFormat:@"努力学习计算机计术，获得计算机技术竞赛特等奖，获得水果手机%.0f部。", changeValue];
            self.itemsView.itemsTableView.boughtItems[6] = [NSNumber numberWithInteger:[self.itemsView.itemsTableView.boughtItems[6] integerValue] + (NSInteger)changeValue];
            self.app.userInfo.usedStorage += (NSInteger)changeValue;
            break;
        default:
            break;
    }
    self.adventureView.adventureEvent = str;
    if (self.adventureView.hidden == NO) {
        self.extraView.hidden = NO;
        self.popupView.hidden = NO;
        [self.popupView updateContent:str];
        self.popupView.titleLabel.text = @"探险结果";
        [self.popupView.closeButton addTarget:self action:@selector(closePopup) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.popupView];
    }
    [self.statusView setStatusControlValue];
}
- (void)getGoodsEvent
{
    NSInteger event = 0;
    NSString *str = @"";
    event = arc4random() % 9 + 1;
    switch (event) {
        case 1:
            str = @"魔都深陷雾霾，重度污染，政府发布雾霾黄色预警信号，防护口罩顿时供不应求。";
            break;
        case 2:
            str = @"又到一年一度的魔都旅游节，景点参观人数爆满。望远镜销量急升。";
            break;
        case 3:
            str = @"伦哥巡回演唱会魔都站，一票难求，看台人满为患。";
            break;
        case 4:
            str = @"据砖家研究，进口奶粉有助于孩子成长，吃进口奶粉长大的孩子远比其它孩子聪明。";
            break;
        case 5:
            str = @"又到一年一度的水果手机发布日，大批黄牛炒作新款水果手机。";
            break;
        case 6:
            str = @"国际形势紧张，金价持续上涨，中国大妈加入抢金大潮。";
            break;
        case 7:
            str = @"国家提出摒弃盲目攀比，提倡理性消费观念，LV包包无人问津。";
            break;
        case 8:
            str = @"杂交水稻又出新成果，米国科学家高价购买相关技术。";
            break;
        case 9:
            str = @"黑社会火拼，军火商大发战争横财。";
            break;
        default:
            break;
    }
    self.goodEventType = event;
    if (self.dayString.length == 0) {
        [self.dayString insertString:[NSString stringWithFormat:@"1，%@", str] atIndex:0];
    } else {
        [self.dayString insertString:[NSString stringWithFormat:@"\n2，%@", str] atIndex:self.dayString.length];
    }
}
- (void)closePopup
{
    self.popupView.hidden = YES;
    self.extraView.hidden = YES;
}
//1显示市集，2从市集返回，3显示交易视图，4关闭交易视图，5,6余X宝；7，8银行；9，10医院；11，12仓库；13显示探险，14关闭探险；15，16显示，关闭结果
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
            [self.itemsView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            break;
        case 2:
            transition.subtype = kCATransitionFromLeft;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.itemsView.layer addAnimation:transition forKey:nil];
            break;
        case 3:
            transition.subtype = kCATransitionFromBottom;
            [self.tradeView.layer addAnimation:transition forKey:nil];
            break;
        case 4:
            transition.subtype = kCATransitionFromTop;
            [self.tradeView.layer addAnimation:transition forKey:nil];
            break;
        case 5:
            transition.subtype = kCATransitionFromRight;
            [self.depositView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            break;
        case 6:
            transition.subtype = kCATransitionFromLeft;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.depositView.layer addAnimation:transition forKey:nil];
            break;
        case 7:
            transition.subtype = kCATransitionFromRight;
            [self.bankView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            break;
        case 8:
            transition.subtype = kCATransitionFromLeft;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.bankView.layer addAnimation:transition forKey:nil];
            break;
        case 9:
            transition.subtype = kCATransitionFromRight;
            [self.hospitalView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            break;
        case 10:
            transition.subtype = kCATransitionFromLeft;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.hospitalView.layer addAnimation:transition forKey:nil];
            break;
        case 11:
            transition.subtype = kCATransitionFromRight;
            [self.storageView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            break;
        case 12:
            transition.subtype = kCATransitionFromLeft;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.storageView.layer addAnimation:transition forKey:nil];
            break;
        case 13:
            transition.subtype = kCATransitionFromRight;
            [self.adventureView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            break;
        case 14:
            transition.subtype = kCATransitionFromLeft;
            [self.mainFuctionView.layer addAnimation:transition forKey:nil];
            [self.placeView.layer addAnimation:transition forKey:nil];
            [self.nextPlaceView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionReveal;
            [self.adventureView.layer addAnimation:transition forKey:nil];
            break;
        case 15:
            transition.subtype = kCATransitionFromBottom;
            [self.resultView.layer addAnimation:transition forKey:nil];
            transition.type = kCATransitionFade;
            [self.layer addAnimation:transition forKey:nil];
            break;
        default:
            break;
    }
}
//点击返回按钮
- (void)backButtonClicked
{
    self.mainHeadView.backButton.hidden = YES;
    self.mainHeadView.settingButton.hidden = NO;
    self.mainFuctionView.hidden = NO;
    self.placeView.hidden = NO;
    self.nextPlaceView.hidden = NO;
    //[self.labelView updateLabel:self.app.userInfo.placeName];
    if (self.itemsView.isHidden == NO) {
        self.itemsView.hidden = YES;
        [self viewTransition:2];
        return;
    }
    if (self.adventureView.isHidden == NO) {
        self.adventureView.hidden = YES;
        [self viewTransition:14];
        return;
    }
    if (self.depositView.isHidden == NO) {
        if ([self.depositView.inputField isFirstResponder]) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect currentFrame = self.depositView.frame;
                currentFrame.origin.y += 150;
                self.depositView.frame = currentFrame;
            }];
            [self.depositView.inputField resignFirstResponder];
        }
        self.depositView.hidden = YES;
        [self viewTransition:6];
        return;
    }
    if (self.bankView.isHidden == NO) {
        self.bankView.hidden = YES;
        [self viewTransition:8];
        return;
    }
    if (self.hospitalView.isHidden == NO) {
        self.hospitalView.hidden = YES;
        [self viewTransition:10];
        return;
    }
    if (self.storageView.isHidden == NO) {
        self.storageView.hidden = YES;
        [self viewTransition:12];
        return;
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (self.tradeView.isHidden == NO && touch.view != self.tradeView) {
        [self viewTransition:4];
        self.tradeView.hidden = YES;
        self.extraView.hidden = YES;
    }
    else if (self.popupView.isHidden == NO && touch.view != self.popupView)
    {
        self.extraView.hidden = YES;
        self.popupView.hidden = YES;
    }
}
#pragma trade
//显示交易视图
- (void)dealTrade:(NSInteger)tradeType withPrice:(NSInteger)price index:(NSInteger)index andNumber:(NSInteger)number
{
    [self viewTransition:3];
    self.extraView.hidden = NO;
    self.tradeView.hidden = NO;
    self.tradeView.maxBuyNumber = 0;
    self.tradeView.maxSellNumber = 0;
    self.tradeView.singlePrice = price;
    self.tradeView.sellOrBuy.selectedSegmentIndex = tradeType - 1;
    NSInteger maxNumber = 0;
    //1为买入，2为卖出
    self.tradeView.maxBuyNumber = (self.app.userInfo.cash + self.app.userInfo.deposit) / (price * self.app.userInfo.discountValue);
    if (self.tradeView.maxBuyNumber > self.app.userInfo.totalStorage - self.app.userInfo.usedStorage) {
        self.tradeView.maxBuyNumber = self.app.userInfo.totalStorage - self.app.userInfo.usedStorage;
    }
    if (self.tradeView.maxBuyNumber < 0) {
        self.tradeView.maxBuyNumber = 0;
    }
    self.tradeView.maxSellNumber = number;
    if (tradeType == 1) {
        maxNumber = self.tradeView.maxBuyNumber;
    } else {
        maxNumber = self.tradeView.maxSellNumber;
    }
    self.tradeView.numberSlider.maximumValue = maxNumber;
    self.tradeView.numberSlider.value = maxNumber;
    self.tradeView.currentItem = index;
    [self.tradeView updateView];
}
//处理交易
- (void)confirmToTrade:(NSInteger)itemIndex withNumber:(NSInteger)number
{
    if (self.tradeView.sellOrBuy.selectedSegmentIndex == 0)
    {
        self.itemsView.itemsTableView.boughtItems[itemIndex] = [NSNumber numberWithInteger:([self.itemsView.itemsTableView.boughtItems[itemIndex] integerValue] + number)];
        NSInteger spendMoney = self.tradeView.singlePrice * number * self.app.userInfo.discountValue;
        if (spendMoney > self.app.userInfo.cash) {
            self.app.userInfo.deposit -= (spendMoney - self.app.userInfo.cash);
            self.app.userInfo.cash = 0;
        } else {
            self.app.userInfo.cash -= spendMoney;
        }
        self.app.userInfo.usedStorage += number;
        self.app.userInfo.discountValue = 1.0;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"交易成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        if (itemIndex == 2)
        {
            NSArray *results = [[NSArray alloc]init];
            results = [self dealAntique:(number)];
            NSInteger goodCount = 0;
            NSInteger badCount = 0;
            for (int i = 0; i < results.count; i++) {
                NSNumber *num = results[i];
                if ([num integerValue] == 1) {
                    goodCount++;
                    self.app.userInfo.cash += self.tradeView.singlePrice * 5;
                }
                else if([num integerValue] == 0)
                {
                    self.app.userInfo.cash += self.tradeView.singlePrice;
                }
                else
                {
                    badCount++;
                }
            }
            NSString *str = [NSString stringWithFormat:@"本次交易的古玩中，共有%ld件稀世珍品，%ld件赝品。", (long)goodCount, (long)badCount];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            if (itemIndex == 0) {
                self.app.userInfo.reputation -= 1;
                if (self.app.userInfo.reputation < 0) {
                    self.app.userInfo.reputation = 0;
                }
            }
            else if (itemIndex == 1)
            {
                self.app.userInfo.reputation -= 2;
                if (self.app.userInfo.reputation < 0) {
                    self.app.userInfo.reputation = 0;
                }
            }
            self.app.userInfo.cash += number * self.tradeView.singlePrice;
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"交易成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        self.app.userInfo.usedStorage -= number;
        self.itemsView.itemsTableView.boughtItems[itemIndex] = [NSNumber numberWithInteger:([self.itemsView.itemsTableView.boughtItems[itemIndex] integerValue ] - number)];
    }
    [self viewTransition:4];
    self.tradeView.hidden = YES;
    self.extraView.hidden = YES;
    [self.itemsView.itemsTableView reloadData];
    [self.statusView setStatusControlValue];
}
//交易古玩，1为稀世珍品，-1为赝品
- (NSArray *)dealAntique:(NSInteger)count
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i < count; i++) {
        float res = 0;
        res = (arc4random() % 100) / 100.0;
        if (res >= 0.9) {
            [arr addObject:[NSNumber numberWithInteger:1]];
        } else if(res <= 0.4) {
            [arr addObject:[NSNumber numberWithInteger:-1]];
        }
        else
        {
            [arr addObject:[NSNumber numberWithInteger:0]];
        }
    }
    return arr;
}

@end

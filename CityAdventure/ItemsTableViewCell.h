//
//  ItemsTableViewCell.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDelegate.h"
#import "MyControl.h"

@interface ItemsTableViewCell: UITableViewCell
@property (strong, nonatomic) UIImageView *itemImage;

@property (strong, nonatomic) UITextView *itemDescription;
@property (strong, nonatomic) MoneyLabel *itemPrice;
@property (strong, nonatomic) UILabel *itemName;
@property (strong, nonatomic) UIButton *buyButton;
@property (strong, nonatomic) UIButton *sellButton;
@property (strong, nonatomic) UILabel *countLabel;
@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) NSObject<TradeDelegate> *delegate;
- (void)updateView;
@end

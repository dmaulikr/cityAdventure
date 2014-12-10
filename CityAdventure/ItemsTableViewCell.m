//
//  ItemsTableViewCell.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/3.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "ItemsTableViewCell.h"

@interface ItemsTableViewCell()
@end
@implementation ItemsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        return self;
}
- (void)updateView
{
    if (self) {
        self.itemImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 36, 36)];
        [self.contentView addSubview:self.itemImage];
        self.itemName = [[UILabel alloc]initWithFrame:CGRectMake(5, 40, 46, 20)];
        self.itemName.textAlignment = NSTextAlignmentCenter;
        self.itemName.textColor = [UIColor colorWithRed:0xac/255.0 green:0x48/255.0 blue:0x48/255.0 alpha:1];
        self.itemName.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.itemName];
        self.countLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 70, 46, 20)];
        [self.countLabel setBackgroundColor:[UIColor colorWithRed:0xa7/255.0 green:0xe3/255.0 blue:0xfa/255.0 alpha:1]];
        [self.countLabel setFont:[UIFont systemFontOfSize:9]];
        [self.countLabel setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.countLabel];
        
        self.itemDescription = [[UITextView alloc]initWithFrame:CGRectMake(56, 0, self.frame.size.width - 66, 70)];
        self.itemDescription.userInteractionEnabled = NO;
        [self.contentView addSubview:self.itemDescription];

        self.itemPrice = [[MoneyLabel alloc]initWithFrame:CGRectMake(56, 70, 150, 20)];
        [self.contentView addSubview:self.itemPrice];
        
        self.buyButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 115, 70, 50, 21)];
        [self.buyButton setImage:[UIImage imageNamed:@"buy-btn"] forState:UIControlStateNormal];
        [self.buyButton addTarget:self action:@selector(beginTrade:) forControlEvents:UIControlEventTouchUpInside];
        [self.buyButton setTag:1];
        [self.contentView addSubview:self.buyButton];
        self.sellButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 60, 70, 50, 21)];
        [self.sellButton setImage:[UIImage imageNamed:@"sell-btn"] forState:UIControlStateNormal];
        [self.sellButton addTarget:self action:@selector(beginTrade:) forControlEvents:UIControlEventTouchUpInside];
        [self.sellButton setTag:2];
        [self.contentView addSubview:self.sellButton];
    }

}
- (void)beginTrade:(id)button
{
    UIButton *btn = (UIButton *)button;
    [self.delegate dealTrade:btn.tag withPrice:[self.itemPrice.text integerValue] index:self.index andNumber:0];
}
@end

//
//  Items.h
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/6.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import <Foundation/Foundation.h>
//商品信息，属性分别为商品名，图片路径，描述，参考价格，最高价，最低价
@interface DetailItems : NSObject
@property (assign, nonatomic) NSString *name;
@property (assign, nonatomic) NSString *imagePath;
@property (assign, nonatomic) NSString *describe;
@property (assign, nonatomic) NSString *importDesc;
@property (assign, nonatomic) NSInteger minPrice;
@property (assign, nonatomic) NSInteger maxPrice;
@property (strong, nonatomic) NSArray *allItems;
- (id)initWithName:(NSString *)name imagePath:(NSString *)path describe:(NSString *)desc importDesc:(NSString *)import minPrice:(NSInteger)min andMaxPrice:(NSInteger)max;
- (DetailItems *)getItem:(NSInteger)index;
//初始化所有商品信息
- (void)initItems;
@end

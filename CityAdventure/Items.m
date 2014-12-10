//
//  Items.m
//  CityAdventure
//
//  Created by 陈晓洁 on 14/11/6.
//  Copyright (c) 2014年 陈晓洁. All rights reserved.
//

#import "Items.h"

@implementation DetailItems

- (id)initWithName:(NSString *)name imagePath:(NSString *)path describe:(NSString *)desc importDesc:(NSString *)import minPrice:(NSInteger)min andMaxPrice:(NSInteger)max
{
    self = [super init];
    if (self) {
        self.name = name;
        self.imagePath = path;
        self.describe = desc;
        self.importDesc = import;
        self.minPrice = min;
        self.maxPrice = max;
    }
    return self;
}
- (void)initItems
{
    DetailItems *item1 = [[DetailItems alloc]initWithName:@"走私军火" imagePath:@"item01" describe:@"全球走私军火交易额达到1000亿美元，利润巨大，但容易受到国家打击。" importDesc:@"卖出时，减少1点声望。参考价值50万。" minPrice:300000 andMaxPrice:800000];
    DetailItems *item2 = [[DetailItems alloc]initWithName:@"机密芯片" imagePath:@"item02" describe:@"内含各种国家机密文件，受到米国等西方国家及恐怖组织眼馋。" importDesc:@"利润大，卖出时，减少2点声望。参考价值18万。" minPrice:100000 andMaxPrice:300000];
    DetailItems *item3 = [[DetailItems alloc]initWithName:@"古玩" imagePath:@"item03" describe:@"具有收藏价值，在卖出时，有可能因为是稀世真品而获得巨大回报，也可能因为是赝品，而一文不值。" importDesc:@"参考价值1.2万。" minPrice:5000 andMaxPrice:20000];
    DetailItems *item4 = [[DetailItems alloc]initWithName:@"LV包包" imagePath:@"item04" describe:@"LV路易威登包，兼具时尚性与实用性。" importDesc:@"参考价值4万。" minPrice:30000 andMaxPrice:50000];
    DetailItems *item5 = [[DetailItems alloc]initWithName:@"钻石" imagePath:@"item05" describe:@"自古以来，钻石一直被人类视为权力、威严、地位和富贵的象征，容易被小偷窃取。" importDesc:@"参考价值2.5万。" minPrice:8000 andMaxPrice:50000];
    DetailItems *item6 = [[DetailItems alloc]initWithName:@"千足金条" imagePath:@"item06" describe:@"保值，投资理财必备物品，受中国大妈喜欢。" importDesc:@"参考价值8888" minPrice:5000 andMaxPrice:12888];
    DetailItems *item7 = [[DetailItems alloc]initWithName:@"水果手机" imagePath:@"item07" describe:@"水果公司研发的智能时尚手机，搭载水果公司研发的XOS操作系统，受广大年轻人喜欢。每年发布之际，价格波动大。" importDesc:@"参考价值4000" minPrice:2000 andMaxPrice:6888];
    DetailItems *item8 = [[DetailItems alloc]initWithName:@"进口奶粉" imagePath:@"item08" describe:@"进口奶粉，含有能够增强婴幼儿免疫系统的重要物质，添加了宝宝生长和发育所需的矿物质及维生素，能为其健康成长提供全面营养。" importDesc:@"参考价格700。" minPrice:300 andMaxPrice:1200];
    DetailItems *item9 = [[DetailItems alloc]initWithName:@"望远镜" imagePath:@"item09" describe:@"浏览景点，演唱会的必备物品。"  importDesc:@"参考价格188。" minPrice:58 andMaxPrice:400];
    DetailItems *item10 = [[DetailItems alloc]initWithName:@"防护口罩" imagePath:@"item10" describe:@"魔都PM2.5浓度高，防护必备。带此物品时，不受雾霾天气影响。" importDesc:@"参考价格35。" minPrice:20 andMaxPrice:128];
    self.allItems = [[NSArray alloc]initWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, nil];
}

- (DetailItems *)getItem:(NSInteger)index
{
    return self.allItems[index];
}
@end

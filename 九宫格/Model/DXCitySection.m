//
//  DXCitySection.m
//  九宫格
//
//  Created by 陈达欣 on 16/4/17.
//  Copyright © 2016年 DeanXChen. All rights reserved.
//

#import "DXCitySection.h"

@implementation DXCitySection

+ (instancetype)citySectionWithDict:(NSDictionary *)dict{
    
    DXCitySection *citySection = [[DXCitySection alloc] init];
    
    citySection.index = dict[@"index"];
    citySection.header = dict[@"header"];
    citySection.cities = dict[@"cities"];
    
    return citySection;
}



@end

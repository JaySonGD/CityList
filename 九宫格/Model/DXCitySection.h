//
//  DXCitySection.h
//  九宫格
//
//  Created by 陈达欣 on 16/4/17.
//  Copyright © 2016年 DeanXChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXCitySection : NSObject

@property(nonatomic, strong) NSString *header;
@property(nonatomic, strong) NSArray *cities;
@property(nonatomic, strong) NSString *index;

+ (instancetype)citySectionWithDict:(NSDictionary *)dict;

@end

//
//  ViewController.m
//  九宫格
//
//  Created by 陈达欣 on 16/4/16.
//  Copyright © 2016年 DeanXChen. All rights
//

#import "ViewController.h"
#import "DXCitySection.h"
#import "TableViewCell1.h"
@interface ViewController ()

//城市组模型
@property(nonatomic, strong) NSArray *citySections;
//城市索引数组
@property(nonatomic, strong) NSMutableArray *cityIndexs;

@end

@implementation ViewController

#pragma mark - 懒加载

//城市模型数组
- (NSArray *)citySections{
    
    if (!_citySections) {
        
        //从plist中加载城市数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cityArray.plist" ofType:nil];
        NSArray *cityArray = [NSArray arrayWithContentsOfFile:path];
        
        //字典数组转成模型数组
        NSMutableArray *tempArray = [NSMutableArray array];
        
        for (int i = 0; i<cityArray.count; i++) {
            
            DXCitySection *section = nil;
            NSDictionary *cityDict = cityArray[i];
            
            section = [DXCitySection citySectionWithDict:cityDict];
            
        
            [tempArray addObject:section];
        }

        _citySections = tempArray;
    }
    return _citySections;
}

//索引数组
- (NSMutableArray *)cityIndexs{
    
    if (!_cityIndexs) {
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int i = 0; i<self.citySections.count; i++) {
            DXCitySection *section = self.citySections[i];
            [tempArray addObject:section.index];
        }
        _cityIndexs = tempArray;
    }
    return _cityIndexs;
}

#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    

    return self.citySections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    DXCitySection *citySection = self.citySections[section];
    
   
    if (section <3) {
        return 1;

    }
    else{
        return citySection.cities.count;

    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    DXCitySection *citySection = self.citySections[indexPath.section];
    if (indexPath.section > 2) {
      cell  = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell.textLabel.text = citySection.cities[indexPath.row];

    }else
    {
         cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        
        TableViewCell1* cell1 = (TableViewCell1*)cell;
         cell1.item = citySection;

    }

    
 
    
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.cityIndexs;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    DXCitySection *citySection = self.citySections[section];
    return citySection.header;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (indexPath.section < 2) {
//        return 250;
//    } else {
//        return 44;
//    }
//    
//}


@end

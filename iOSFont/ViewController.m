//
//  ViewController.m
//  iOSFont
//
//  Created by mahong on 15/10/15.
//  Copyright © 2015年 mahong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mainTable;
    
    NSArray *tableData;
    
    NSMutableDictionary *tableDict;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"元贝字体";
    
    mainTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    [self.view addSubview:mainTable];
    
    tableDict = [NSMutableDictionary dictionary];
    
    tableData = [UIFont familyNames];
    
    for (NSString *fontName in tableData)
    {
        NSArray *fontarray = [UIFont fontNamesForFamilyName:fontName];
        [tableDict setObject:fontarray forKey:fontName];
    }
    
    NSLog(@"tabledict  %@",tableDict);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [tableData objectAtIndex:section];
    
    NSArray *array = [tableDict objectForKey:key];
    
    return array.count == 0 ? 1 : array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSString *key = [tableData objectAtIndex:indexPath.section];
    
    NSArray *array = [tableDict objectForKey:key];
    
    cell.textLabel.text = @"记录点滴,与君共勉 helloworld 2015.10.15";
    
    if (array.count == 0)
    {
        cell.textLabel.font = [UIFont fontWithName:key size:16];
        cell.detailTextLabel.text = key;
    }
    else
    {
        cell.textLabel.font = [UIFont fontWithName:[array objectAtIndex:indexPath.row] size:16];
        
        cell.detailTextLabel.text = [array objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0f;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [tableData objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  YPATableCustomVC.m
//  YelpApp
//
//  Created by Savitha Reddy on 8/27/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "YPATableCustomVC.h"
#import "YPATableViewCell.h"

@interface YPATableCustomVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation YPATableCustomVC
{
    NSArray *tableArray;
    UITableView *customTableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        tableArray = [[NSMutableArray alloc] init];
        customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREEN_HEIGHT) style:UITableViewStylePlain];
        customTableView.delegate = self;
        customTableView.dataSource = self;
        customTableView.rowHeight = 65;
        customTableView.separatorColor = [UIColor clearColor];
        customTableView.sectionFooterHeight = 22;
        customTableView.sectionHeaderHeight = 22;
        customTableView.scrollEnabled = YES;
        customTableView.showsVerticalScrollIndicator = YES;
//        customTableView.userInteractionEnabled = YES;
        customTableView.bounces = YES;
        [self.view addSubview:customTableView];
        
        tableArray = @[@"hello",@"hello1",@"hello3",@"hello",@"hello1",@"hello3",@"hello",@"hello1",@"hello3",@"hello",@"hello1",@"hello3"];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YPATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (cell == nil) {
        cell = [[YPATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    cell.textLabel.text = tableArray[indexPath.row];
//    cell.separatorInset = UIEdgeInsetsMake(0, 0, 10, 0);
//    cell.backgroundColor = [UIColor lightGrayColor];
//    cell.alpha = 0.5;
    return cell;
}















- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


@end

//
//  ViewController.m
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/28.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import "ViewController.h"
#import "JJAddViewController.h"
#import "JJAccountModel.h"
#import "JJAccountCell.h"
#import "JJShowViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tab;

/**
 表格数据源
 */
@property(nonatomic,strong)NSArray<JJAccountModel *> *dataSource;


@end

@implementation ViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"返回";
    self.navigationItem.backBarButtonItem = backBtn;
    
    self.tab.tableFooterView = [UIView new];
    
    self.tab.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view, typically from a nib.
    bg_setSqliteName(tabName);
    
    [self loadData];
    
}

- (void)loadData
{
   self.dataSource = [JJAccountModel bg_findAll:@"JJPwdList"];
    
    [self.tab reloadData];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     JJAccountCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[JJAccountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.dataSource[indexPath.row] paltformName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JJAccountModel *model =self.dataSource[indexPath.row];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //加载StoryBoard当中箭头指向的控制器.
    JJShowViewController *vc =  [storyBoard instantiateViewControllerWithIdentifier:@"JJShowViewController"];
 
    vc.model = model;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return @"删除";
}

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    JJAccountModel *model = self.dataSource[indexPath.row];
    
    [JJAccountModel bg_delete:tabName row:indexPath.row + 1];
    
    [self loadData];
    
    [tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"aikesi_add"])
    {
        JJAddViewController *vc = segue.destinationViewController;
        
        vc.addFinishBlock = ^{
          
            [self loadData];//!< 刷新数据
            
        };
    }
    
}

@end

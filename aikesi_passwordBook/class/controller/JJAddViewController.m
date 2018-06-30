//
//  JJAddViewController.m
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/28.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import "JJAddViewController.h"
#import "MBProgressHUD+NJ.h"

#import "JJAccountModel.h"

@interface JJAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *platformTF;
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation JJAddViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
 
     
    
}

- (IBAction)confirmBtnClick:(id)sender {
    
    if (_pwdTF.text.length == 0 || _accountTF.text.length == 0 || _platformTF.text.length == 0)
    {
        
        [MBProgressHUD showError:@"信息不完整" toView:self.view];
        
        return;
        
    }
    
    //!< 保存模型数据
    JJAccountModel *model = [JJAccountModel new];
    
    model.pwd = self.pwdTF.text;
    
    model.account = self.accountTF.text;
    
    model.paltformName = self.platformTF.text;
    
    model.bg_tableName = tabName;
    
    [model bg_save];
    
    if (self.addFinishBlock)
    {
        self.addFinishBlock();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end

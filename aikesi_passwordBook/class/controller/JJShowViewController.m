//
//  JJShowViewController.m
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/30.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import "JJShowViewController.h"
#import "MBProgressHUD+NJ.h"
@interface JJShowViewController ()
@property (weak, nonatomic) IBOutlet UITextField *platformTF;
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;

@end

@implementation JJShowViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"账户详细信息";
    
    self.accountTF.text = _model.account;
    
    self.pwdTF.text = _model.pwd;
    
    self.platformTF.text = _model.paltformName;
    
    

}

- (IBAction)editClick:(UIButton *)sender {
    
    if (_pwdTF.text.length == 0 || _accountTF.text.length == 0 || _platformTF.text.length == 0)
    {
        
        [MBProgressHUD showError:@"信息不完整" toView:self.view];
        
        return;
        
    }
    
    if(sender.selected)
    {
        //!< 编辑完成  点击完成要保存数据
        _model.paltformName = self.platformTF.text;
        
        _model.pwd = self.pwdTF.text;
        
        _model.account = self.accountTF.text;
        
        [_model bg_saveOrUpdate];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else
    {
        //!< 点击开始编辑
        self.pwdTF.enabled = YES;
        self.accountTF.enabled = YES;
        self.platformTF.enabled = YES;
 
        self.pwdTF.borderStyle = UITextBorderStyleRoundedRect;
        self.accountTF.borderStyle = UITextBorderStyleRoundedRect;
        self.platformTF.borderStyle = UITextBorderStyleRoundedRect;
        
        self.title = @"正在编辑...";
        
        
        
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        
        sender.selected = YES;
    }
    
   
    
    
}
- (IBAction)back:(id)sender {
    
     [self.navigationController popViewControllerAnimated:YES];
}


@end

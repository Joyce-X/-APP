//
//  JJAccountModel.h
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/30.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BGFMDB.h"

#define tabName @"JJPwdList"

@interface JJAccountModel : NSObject
/**
 平台名称
 */
@property(nonatomic,copy)NSString *paltformName;

/**
 账号
 */
@property(nonatomic,copy)NSString *account;

/**
 密码
 */
@property(nonatomic,copy)NSString *pwd;

/**
 快速创建实例

 @param dic 字典模型
 @return 实例
 */
- (instancetype)initWithDictionary:(NSDictionary *)dic;


@end

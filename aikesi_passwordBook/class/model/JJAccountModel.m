//
//  JJAccountModel.m
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/30.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import "JJAccountModel.h"

@implementation JJAccountModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self)
    {
        self.pwd = dic[@"pwd"];
    }
    
    return self;
    
}

 
@end

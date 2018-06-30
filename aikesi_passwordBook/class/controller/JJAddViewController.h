//
//  JJAddViewController.h
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/28.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completeBlock) (void);

@interface JJAddViewController : UIViewController

/**
 添加完成的回调
 */
@property(nonatomic,copy)completeBlock addFinishBlock;

@end

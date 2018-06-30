//
//  JJAccountCell.m
//  aikesi_passwordBook
//
//  Created by aikesi on 2018/6/30.
//  Copyright © 2018年 aikesi. All rights reserved.
//

#import "JJAccountCell.h"

@implementation JJAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.textLabel.textColor = [UIColor colorWithRed:14/255.0 green:140/255.0 blue:9/255.0 alpha:1];
        
        self.textLabel.font = [UIFont boldSystemFontOfSize:16];
        
    }
    
    return self;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(40, 0, 300, self.contentView.bounds.size.height);
    
}

@end

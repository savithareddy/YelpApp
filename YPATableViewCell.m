//
//  YPATableViewCell.m
//  YelpApp
//
//  Created by Savitha Reddy on 8/27/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "YPATableViewCell.h"

@implementation YPATableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *viewCell = [[UIView alloc] initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH-20, 60)];
        viewCell.backgroundColor = [UIColor lightGrayColor];
        viewCell.alpha = 0.5;
        viewCell.layer.cornerRadius = 5;
        [self.contentView addSubview:viewCell];
        
    }
    return self;
}

- (void)awakeFromNib
{
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end

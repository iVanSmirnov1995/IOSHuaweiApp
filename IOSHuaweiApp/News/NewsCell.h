//
//  NewsCell.h
//  IOSHuaweiApp
//
//  Created by devil1001 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@class NewsCell;

@protocol newsTableCell

-(void)tableviewCell:(UITableViewCell *)cell;

@end

@interface NewsCell : UITableViewCell

- (void) fillCellWithModel:(NewsModel *)model;

@end

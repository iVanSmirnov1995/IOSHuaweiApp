//
//  NewsCell.m
//  IOSHuaweiApp
//
//  Created by devil1001 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleText;

@end

@implementation NewsCell

-(void) fillCellWithModel:(NewsModel *)model {
    self.titleText.text = model.title;
    
    NSURL *imagePostURL = [NSURL URLWithString:model.image];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:imagePostURL];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        UIImage *videoImage = [UIImage  imageWithData:data];
        [self.newsImageView setImage:videoImage];
        self.newsImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self layoutIfNeeded];
        self.newsImageView.layer.masksToBounds = YES;
        
    }];
    
    
}

@end

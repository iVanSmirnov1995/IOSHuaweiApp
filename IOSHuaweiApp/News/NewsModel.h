//
//  NewsModel.h
//  IOSHuaweiApp
//
//  Created by devil1001 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property(strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *image;

-(instancetype) initNews:(NSString *)title image:(NSString *)image;

@end


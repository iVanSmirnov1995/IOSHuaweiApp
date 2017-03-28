//
//  NewsModel.m
//  IOSHuaweiApp
//
//  Created by devil1001 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

-(instancetype) initNews:(NSString *)title image:(NSString *)image {
    if (self = [super init]){
        _title = title;
        _image = image;
    }
    return self;
}

@end

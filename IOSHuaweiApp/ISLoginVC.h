//
//  ISLoginVC.h
//  IOSHuaweiApp
//
//  Created by Smirnov Ivan on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISLoginVC : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *logButton;
@property (weak, nonatomic) IBOutlet UIButton *regButton;
- (IBAction)reg:(UIButton *)sender;

@end

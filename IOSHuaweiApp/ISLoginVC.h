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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *keyboardCost;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLabC;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *botCon;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButt;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFeldAr;

- (IBAction)goApp:(UIButton *)sender;

@end

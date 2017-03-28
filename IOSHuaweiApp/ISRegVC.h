//
//  ISRegVC.h
//  IOSHuaweiApp
//
//  Created by Smirnov Ivan on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISRegVC : UIViewController
- (IBAction)log:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *kayConst;
@property (weak, nonatomic) IBOutlet UITextField *mailTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *fNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


@end

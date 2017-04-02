//
//  MSUserAccountVC.h
//  IOSHuaweiApp
//
//  Created by Максим Стегниенко on 29.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MSUserAccountVC : UITableViewController


@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *PatronymicField;
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberFiled;



@end

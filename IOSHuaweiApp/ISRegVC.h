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

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *anTextFs;
@property (weak, nonatomic) IBOutlet UIButton *regBut;
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
- (IBAction)regAction:(UIButton *)sender;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFildArr;


@end

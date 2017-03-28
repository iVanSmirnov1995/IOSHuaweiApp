//
//  ISLoginVC.m
//  IOSHuaweiApp
//
//  Created by Smirnov Ivan on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "ISLoginVC.h"
#import "ISRegVC.h"

@interface ISLoginVC ()<UITextFieldDelegate>

@end

@implementation ISLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)reg:(UIButton *)sender {
    
   ISRegVC* vc=[self.storyboard instantiateViewControllerWithIdentifier:@"reg"];
   [self presentViewController:vc animated:NO completion:^{
       
       
       
       
   }];
    
}

#pragma mark-UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.keyboardCost.constant=150.f;
        [self.view layoutIfNeeded];
        
        NSLog(@"gawrg");
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    if ([textField isEqual:self.login]) {
        [self.password becomeFirstResponder];
    } else {
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [textField resignFirstResponder];
            self.keyboardCost.constant=340.f;
            [self.view layoutIfNeeded];
            
            
        } completion:^(BOOL finished) {
            
        }];
        
        
    }
    
    
    return YES;
}

@end

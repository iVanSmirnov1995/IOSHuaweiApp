//
//  ISRegVC.m
//  IOSHuaweiApp
//
//  Created by Smirnov Ivan on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "ISRegVC.h"
#import "ISLoginVC.h"

@interface ISRegVC ()

@end

@implementation ISRegVC

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

- (IBAction)log:(UIButton *)sender {
    
    ISLoginVC* vc=[self.storyboard instantiateViewControllerWithIdentifier:@"log"];
    [self presentViewController:vc animated:NO completion:^{
        
    }];
    
}



#pragma mark-UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.kayConst.constant=180.f;
        [self.view layoutIfNeeded];
        
        NSLog(@"gawrg");
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    if ([textField isEqual:self.mailTF]) {
        [self.passwordTF becomeFirstResponder];
    } else
        if([textField isEqual:self.passwordTF])
        {
            [self.nameTF becomeFirstResponder];
        } else
            if ([textField isEqual:self.nameTF]) {
                
               [self.fNameTF becomeFirstResponder];
            }else{
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [textField resignFirstResponder];
            self.kayConst.constant=250.f;
            [self.view layoutIfNeeded];
            
            
        } completion:^(BOOL finished) {
            
        }];
        
        
    }
    
    
    return YES;
}




@end

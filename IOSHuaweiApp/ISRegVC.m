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
    
    for (UITextField* tf in self.anTextFs) {
        
        tf.alpha=0;
    }
    [self.regBut setBackgroundColor:[UIColor whiteColor]];
    self.infoButton.alpha=0;
    UIColor* c=[UIColor colorWithRed:255.f/255.f green:94.f/255.f blue:86.f/255.f alpha:1];
    [self.registButton setTitleColor:c forState:UIControlStateNormal];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        [self.regBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIColor* c=[UIColor colorWithRed:255.f/255.f green:94.f/255.f blue:86.f/255.f alpha:1];
        [self.registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.regBut setBackgroundColor:c];
        
        self.infoButton.alpha=1;
        
        for (UITextField* tf in self.anTextFs) {
            
            tf.alpha=1;
        }
        
        
        
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
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
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    if ([textField isEqual:self.mailTF]) {
        NSString* mail=textField.text;
        [self.passwordTF becomeFirstResponder];
    } else
        if([textField isEqual:self.passwordTF])
        {
            NSString* password=textField.text;
            [self.nameTF becomeFirstResponder];
        } else
            if ([textField isEqual:self.nameTF]) {
               NSString* name=textField.text;

               [self.fNameTF becomeFirstResponder];
            }else{
        
                NSString* fName=textField.text;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [textField resignFirstResponder];
            self.kayConst.constant=250.f;
            [self.view layoutIfNeeded];
            
            
        } completion:^(BOOL finished) {
            
        }];
        
        
    }
    
    
    return YES;
}




- (IBAction)regAction:(UIButton *)sender {
    
    NSInteger i=0;
    for (UITextField* tf in self.textFildArr) {
        
        if ([tf.text isEqualToString:@""]) {
            i++;
        }
        
    }
    
    NSString* massage=@"";
    if (i==0) {
        massage=@"Вы успешно зарегистрированы";
    }else
        massage=@"Одно из полей не заполненно";
    
    
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@""
                                  message:massage
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
@end

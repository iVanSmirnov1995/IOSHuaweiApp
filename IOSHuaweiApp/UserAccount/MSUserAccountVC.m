//
//  MSUserAccountVC.m
//  IOSHuaweiApp
//
//  Created by Максим Стегниенко on 29.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//


#import "MSUserAccountVC.h"

@interface MSUserAccountVC () <UITextFieldDelegate>

@property (assign,nonatomic) BOOL isEdit;

@end

@implementation MSUserAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"Профиль";
    
 
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.lastNameField.delegate = self;
    self.firstNameField.delegate = self;
    self.PatronymicField.delegate = self;
    self.loginField.delegate = self;
    self.passwordField.delegate = self;
    self.phoneNumberFiled.delegate = self;
    
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"editButton@3x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStyleDone target:self action:@selector(actionEdit)];
    
    
    self.navigationItem.rightBarButtonItem = editItem;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

- (void) actionEdit{
    self.isEdit = YES;
    [self.lastNameField becomeFirstResponder];
    
    
}



-(void)dismissKeyboard
{
    
    
    if ([self.lastNameField isFirstResponder]) {
        [self.lastNameField resignFirstResponder];
        
    }
    
    if ([self.firstNameField isFirstResponder]) {
        [self.firstNameField resignFirstResponder];
        
    }
    if ([self.PatronymicField isFirstResponder]) {
        [self.PatronymicField resignFirstResponder];
        
    }
    if ([self.loginField isFirstResponder]) {
        [self.loginField resignFirstResponder];
        
    }
    if ([self.passwordField isFirstResponder]) {
        [self.passwordField resignFirstResponder];
        
    }
    
    if ([self.phoneNumberFiled isFirstResponder]) {
        [self.phoneNumberFiled resignFirstResponder];
        
    }
    
    
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.lastNameField]) {
        
        return [self.firstNameField becomeFirstResponder];
    }
    if ([textField isEqual:self.firstNameField]) {
        
        return [self.PatronymicField becomeFirstResponder];
    }
    if ([textField isEqual:self.PatronymicField]) {
        
        return [self.loginField becomeFirstResponder];
    }
    if ([textField isEqual:self.loginField]) {
        
        return [self.passwordField becomeFirstResponder];
    }
    if ([textField isEqual:self.passwordField]) {
        
        return [textField resignFirstResponder];
    }
    
    
    
    
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.isEdit) {
        
        return YES;
    }
    else {
        return NO;
    }
    return NO;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField isEqual:self.phoneNumberFiled]) {
        
        NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSArray* components = [string componentsSeparatedByCharactersInSet:validationSet];
        
        if ([components count] > 1) {
            return NO;
        }
        
        NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        
        NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
        
        newString = [validComponents componentsJoinedByString:@""];
        
        
        static const int localNumberMaxLength = 7;
        static const int areaCodeMaxLength = 3;
        static const int countryCodeMaxLength = 3;
        
        if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
            return NO;
        }
        
        
        NSMutableString* resultString = [NSMutableString string];
        
        
        NSInteger localNumberLength = MIN([newString length], localNumberMaxLength);
        
        if (localNumberLength > 0) {
            
            NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLength];
            
            [resultString appendString:number];
            
            if ([resultString length] > 3) {
                [resultString insertString:@"-" atIndex:3];
            }
            
        }
        
        if ([newString length] > localNumberMaxLength) {
            
            NSInteger areaCodeLength = MIN((int)[newString length] - localNumberMaxLength, areaCodeMaxLength);
            
            NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
            
            NSString* area = [newString substringWithRange:areaRange];
            
            area = [NSString stringWithFormat:@"(%@) ", area];
            
            [resultString insertString:area atIndex:0];
        }
        
        if ([newString length] > localNumberMaxLength + areaCodeMaxLength) {
            
            NSInteger countryCodeLength = MIN((int)[newString length] - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
            
            NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
            
            NSString* countryCode = [newString substringWithRange:countryCodeRange];
            
            countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
            
            [resultString insertString:countryCode atIndex:0];
        }
        
        
        textField.text = resultString;
        
        return NO;
    }
    
    else {
        return YES;
    }
}


@end

//
//  SupportVC.m
//  IOSHuaweiApp
//
//  Created by 1 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "SupportVC.h"
#import "SupportModel.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

#define PingFangTC18 [UIFont fontWithName:@"PingFang TC" size:18.0]

#define MyTextColor Rgb2UIColor(147,147,147)


@interface SupportVC ()<MFMailComposeViewControllerDelegate, UITextViewDelegate>
@property (strong,nonatomic)    SupportModel *model;

@property (weak, nonatomic) IBOutlet UILabel *supportEmail;
@property (weak, nonatomic) IBOutlet UILabel *surname;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *secondName;

@property (weak, nonatomic) IBOutlet UILabel *login;
@property (weak, nonatomic) IBOutlet UILabel *telNumber;
@property (weak, nonatomic) IBOutlet UILabel *deviceModel;
@property (weak, nonatomic) IBOutlet UITextView *problemText;

- (IBAction)sendButton:(id)sender;

@end

@implementation SupportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.opaque=YES;
    //  self.navigationController.navigationBar.translucent=NO;
    self.navigationItem.title=@"Техническая поддержка";
    self.navigationController.navigationBar.backgroundColor=Rgb2UIColor(255, 69, 69);
    
    
    
    _model=[[SupportModel alloc]init];
    [self.model useModel];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.textLabel.font=PingFangTC18;
    cell.detailTextLabel.font=PingFangTC18;
    cell.textLabel.textColor=MyTextColor;
    cell.detailTextLabel.textColor=MyTextColor;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    _supportEmail.text=self.model.supportEmail;
    _surname.text=self.model.surname;
    _name.text=self.model.name;
    _secondName.text=self.model.secondName;
    _login.text=self.model.login;
    _telNumber.text=self.model.telNumber;
    _deviceModel.text=self.model.deviceModel;
    _problemText.text=self.model.problemText;
    
    _problemText.delegate=self;
}



- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([view isMemberOfClass:[UITableViewHeaderFooterView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor whiteColor];
        ((UITableViewHeaderFooterView *)view).textLabel.font=[UIFont fontWithName:@"PingFang TC-Thin" size:20.0];
        ((UITableViewHeaderFooterView *)view).textLabel.textColor=MyTextColor;
        
    }
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self composeLetter];
}
-(void)composeLetter{
    self.model.problemText=self.problemText.text;
    NSLog(@"I compose");
    NSArray *stringComponents = [NSArray arrayWithObjects:
                                 @"Пользователь: ",
                                 self.model.login, @" ", @"\n",
                                 self. model.name,@" ",
                                 self.model.secondName,@" ",
                                 self.model.surname,@" ", @"\n",
                                 @"Контактные данные: ", self.model.telNumber,@" ", @"\n",
                                 @"Устройство: ", self.model.deviceModel,@" ", @"\n",
                                 @"Проблема:" , self.model.problemText,@" ",
                                 @"\n",
                                 nil] ;
    
    NSString *result=[[NSString alloc]init];
    for (NSString* str in stringComponents) {
        result=[result stringByAppendingString:str];
    }
    
    NSLog(@"I composed: %@", result);
    
    self.model.problemText=result;

}

- (IBAction)sendButton:(id)sender
{
    [self composeLetter];

    
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setToRecipients:[NSArray arrayWithObject:self.model.supportEmail]];
        
        [mailCont setSubject:@"Tech support question"];
        
        [mailCont setMessageBody:self.model.problemText isHTML:NO];
       // [self.navigationController pushViewController:mailCont animated:YES];
        [self presentViewController:mailCont animated:YES completion:nil];
        
    
    }
    else{
        NSLog(@"app can't send emails");
    }
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    //handle any error
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end

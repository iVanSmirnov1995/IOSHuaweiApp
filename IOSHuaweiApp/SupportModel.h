//
//  SupportModel.h
//  IOSHuaweiApp
//
//  Created by 1 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface SupportModel : NSObject <MFMailComposeViewControllerDelegate>
-(void)useModel;
-(void)sendLetter:(NSString* ) letter withCompletionHandler:(void(^)(MFMailComposeViewController *mailCont))completionBlock;


@property(strong,nonatomic)NSString *supportEmail;

@property(strong,nonatomic)NSString *surname;
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *secondName;

@property(strong,nonatomic)NSString *login;
@property(strong,nonatomic)NSString *password;

@property(strong,nonatomic)NSString *telNumber;
@property(strong,nonatomic)NSString *deviceModel;

@property(strong,nonatomic)NSString *problemText;

@end

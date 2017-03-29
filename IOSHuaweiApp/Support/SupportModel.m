//
//  SupportModel.m
//  IOSHuaweiApp
//
//  Created by 1 on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "SupportModel.h"


@implementation SupportModel

-(void)useModel{
    
   // self.supportEmail=@"huawei.task@best-bmstu.ru";
    self.supportEmail=@"leosilver@yandex.ru";
    
    self.surname=@"Стегниенко";
    self.name=@"Максим";
    self.secondName=@"Вячеславович";
    
    self.login=@"MaxiJunkie";
    self.password=@"*******";
    
    self.telNumber=@"+7 (926) 123-40-99";
    
    self.deviceModel=@"Honor 8";
    
    self.problemText=@"я что-то нажала и всё исчезло";
}

-(void)sendLetter:(NSString* ) letter
withCompletionHandler:(void(^)(MFMailComposeViewController *mailCont))completionBlock{
    
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        [mailCont setSubject:@"Your email"];
        [mailCont setMessageBody:[@"Your body for this message is " stringByAppendingString:@" this is awesome"] isHTML:NO];
        
        if (completionBlock) {
            completionBlock(mailCont);
        }
    //    [self presentViewController:mailCont animated:YES completion:nil];
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    //handle any error
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
/*  NSString *unformatted=self.telNumber;
 NSArray *stringComponents = [NSArray arrayWithObjects:
 [unformatted substringWithRange: NSMakeRange(0, 0)],
 [unformatted substringWithRange: NSMakeRange(1, 4)],
 [unformatted substringWithRange:NSMakeRange(4, 4)],
 [unformatted substringWithRange:NSMakeRange(7, [unformatted length]-6)], nil];
 NSString *formattedString = [NSString stringWithFormat:@"%@(%@)%@-%@", [stringComponents objectAtIndex:0], [stringComponents objectAtIndex:1], [stringComponents objectAtIndex:2],[stringComponents objectAtIndex:3]];
 NSLog(@"Formatted Phone Number: %@", formattedString);
 */

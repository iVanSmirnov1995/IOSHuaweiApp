//
//  ISLoginVC.m
//  IOSHuaweiApp
//
//  Created by Smirnov Ivan on 28.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import "ISLoginVC.h"
#import "ISRegVC.h"

@interface ISLoginVC ()

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
@end

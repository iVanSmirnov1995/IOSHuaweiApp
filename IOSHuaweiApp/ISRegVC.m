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
@end

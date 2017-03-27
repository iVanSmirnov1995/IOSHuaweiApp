//
//  AppDelegate.h
//  IOSHuaweiApp
//
//  Created by Smirnov Ivan on 27.03.17.
//  Copyright © 2017 Smirnov Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


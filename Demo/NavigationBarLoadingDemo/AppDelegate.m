//
//  AppDelegate.m
//  NavigationBarLoadingDemo
//
//  Created by Anton Gaenko on 09.01.15.
//  Copyright (c) 2015 Anton Gaenko. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIActivityIndicatorView appearanceWhenContainedIn:[UINavigationBar class], nil].color = [UIColor blackColor];
    return YES;
}

@end

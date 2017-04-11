//
//  AppDelegate.m
//  TableCollectionTest
//
//  Created by Antoninus Lamptey on 4/10/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *viewC = [[ViewController alloc] init];
    
    
    self.window.rootViewController = viewC;
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end

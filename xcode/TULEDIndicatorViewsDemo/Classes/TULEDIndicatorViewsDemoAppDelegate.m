//
//  TULEDIndicatorViewsDemoAppDelegate.m
//  TULEDIndicatorViewsDemo
//
//  Copyright Tortuga 22, Inc 2009. All rights reserved.
//

#import "TULEDIndicatorViewsDemoAppDelegate.h"
#import "TULEDIndicatorViewsDemoViewController.h"

@implementation TULEDIndicatorViewsDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

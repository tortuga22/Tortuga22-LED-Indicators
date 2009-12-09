//
//  TULEDIndicatorViewsDemoAppDelegate.h
//  TULEDIndicatorViewsDemo
//
//  Copyright Tortuga 22, Inc 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TULEDIndicatorViewsDemoViewController;

@interface TULEDIndicatorViewsDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TULEDIndicatorViewsDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TULEDIndicatorViewsDemoViewController *viewController;

@end


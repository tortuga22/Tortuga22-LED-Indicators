//
//  TULEDIndicatorView+Convenience.h
//  TULEDIndicatorViews
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TULEDIndicatorView.h"

@interface TULEDIndicatorView (Convenience)

// Convenience Initializers - Manual + NSNotification
-(id)initAsAmberWithFrame:(CGRect)frame;
-(id)initAsBlueWithFrame:(CGRect)frame;
-(id)initAsGreenWithFrame:(CGRect)frame;
-(id)initAsRedWithFrame:(CGRect)frame;
-(id)initAsUVWithFrame:(CGRect)frame;
-(id)initAsWhiteWithFrame:(CGRect)frame;
-(id)initAsYellowWithFrame:(CGRect)frame;
-(id)initWithFrame:(CGRect)frame color:(NSString *)color;

// Convenience Initializers - KVO
-(id)initAsAmberWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initAsBlueWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initAsGreenWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initAsRedWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initAsUVWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initAsWhiteWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initAsYellowWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(id)initWithFrame:(CGRect)frame color:(NSString *)color watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;

// Convenience Constructors - Manual and Notification
+(id)amberLEDIndicatorWithFrame:(CGRect)frame;
+(id)blueLEDIndicatorWithFrame:(CGRect)frame;
+(id)greenLEDIndicatorWithFrame:(CGRect)frame;
+(id)redLEDIndicatorWithFrame:(CGRect)frame;
+(id)uvLEDIndicatorWithFrame:(CGRect)frame;
+(id)whiteLEDIndicatorWithFrame:(CGRect)frame;
+(id)yellowLEDIndicatorWithFrame:(CGRect)frame;
+(id)ledIndicatorWithFrame:(CGRect)frame color:(NSString *)color;

// Convenience Constructors - KVO
+(id)amberLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)blueLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)greenLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)redLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)uvLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)whiteLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)yellowLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
+(id)ledIndicatorWithFrame:(CGRect)frame color:(NSString *)color watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;

// Convenience Set-Up - Manual + Notification
-(void)makeAmber;
-(void)makeBlue;
-(void)makeGreen;
-(void)makeRed;
-(void)makeUV;
-(void)makeWhite;
-(void)makeYellow;
-(void)makeColor:(NSString *)color;

// Convenience Set-Up - KVO
-(void)makeAmberWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeBlueWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeGreenWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeRedWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeUVWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeWhiteWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeYellowWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)makeColor:(NSString *)color  watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;

@end

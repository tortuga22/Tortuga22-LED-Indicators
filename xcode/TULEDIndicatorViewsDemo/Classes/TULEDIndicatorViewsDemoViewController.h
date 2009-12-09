//
//  TULEDIndicatorViewsDemoViewController.h
//  TULEDIndicatorViewsDemo
//
//  Copyright Tortuga 22, Inc 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TULEDIndicatorViews.h>

@class TULEDKVOFlipFlop;

@interface TULEDIndicatorViewsDemoViewController : UIViewController {
	IBOutlet TULEDIndicatorView *amberSmallLED;
	IBOutlet TULEDIndicatorView *blueSmallLED;
	IBOutlet TULEDIndicatorView *greenSmallLED;
	IBOutlet TULEDIndicatorView *redSmallLED;
	IBOutlet TULEDIndicatorView *uvSmallLED;
	IBOutlet TULEDIndicatorView *whiteSmallLED;
	IBOutlet TULEDIndicatorView *yellowSmallLED;
	
	IBOutlet TULEDIndicatorView *redLEDNumber2;
	IBOutlet TULEDIndicatorView *redLEDNumber3;
	IBOutlet TULEDIndicatorView *redLEDNumber4;
	IBOutlet TULEDIndicatorView *redLEDNumber5;
	IBOutlet TULEDIndicatorView *redLEDNumber6;
	IBOutlet TULEDIndicatorView *redLEDNumber7;
	IBOutlet TULEDIndicatorView *redLEDNumber8;
	
	IBOutlet TULEDIndicatorView *kvoDemoLED;
	IBOutlet TULEDIndicatorView *kvoInvertedDemoLED;
	IBOutlet TULEDIndicatorView *notificationDemoLED;
	
	IBOutlet UIButton *sendOnNotificationButton;
	IBOutlet UIButton *sendOffNotification;
	IBOutlet UIButton *turnButtonStripsOnButton;
	IBOutlet UIButton *turnButtonStripsOffButton;
	
	TULEDKVOFlipFlop *flipFlop;
}

@property(nonatomic, retain) TULEDIndicatorView *amberSmallLED;
@property(nonatomic, retain) TULEDIndicatorView *blueSmallLED;
@property(nonatomic, retain) TULEDIndicatorView *greenSmallLED;
@property(nonatomic, retain) TULEDIndicatorView *redSmallLED;
@property(nonatomic, retain) TULEDIndicatorView *uvSmallLED;
@property(nonatomic, retain) TULEDIndicatorView *whiteSmallLED;
@property(nonatomic, retain) TULEDIndicatorView *yellowSmallLED;

@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber2;
@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber3;
@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber4;
@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber5;
@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber6;
@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber7;
@property(nonatomic, retain) TULEDIndicatorView *redLEDNumber8;

@property(nonatomic, retain) TULEDIndicatorView *kvoDemoLED;
@property(nonatomic, retain) TULEDIndicatorView *kvoInvertedDemoLED;
@property(nonatomic, retain) TULEDIndicatorView *notificationDemoLED;

@property(nonatomic, retain) UIButton *sendOnNotificationButton;
@property(nonatomic, retain) UIButton *sendOffNotification;
@property(nonatomic, retain) UIButton *turnButtonStripsOnButton;
@property(nonatomic, retain) UIButton *turnButtonStripsOffButton;

@property(nonatomic, retain) TULEDKVOFlipFlop *flipFlop;

// IBActions
-(IBAction)sendOnNotificationButtonPushed:(id)sender;
-(IBAction)sendOffNotificationButtonPushed:(id)sender;
-(IBAction)turnButtonStripsOnButtonPushed:(id)sender;
-(IBAction)turnButtonStripsOffButtonPushed:(id)sender;

@end


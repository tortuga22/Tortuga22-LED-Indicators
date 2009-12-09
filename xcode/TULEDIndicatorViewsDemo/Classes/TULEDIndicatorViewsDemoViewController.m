//
//  TULEDIndicatorViewsDemoViewController.m
//  TULEDIndicatorViewsDemo
//
//  Copyright Tortuga 22, Inc 2009. All rights reserved.
//

#import "TULEDIndicatorViewsDemoViewController.h"
#import "TULEDKVOFlipFlop.h"

#define TULEDIndicatorViewsDemoOnNotification (@"com.tortuga22.TULEDIndicatorViewsDemo.onNotification")
#define TULEDIndicatorViewsDemoOffNotification (@"com.tortuga22.TULEDIndicatorViewsDemo.offNotification")


@implementation TULEDIndicatorViewsDemoViewController

@synthesize amberSmallLED;
@synthesize blueSmallLED;
@synthesize greenSmallLED;
@synthesize redSmallLED;
@synthesize uvSmallLED;
@synthesize whiteSmallLED;
@synthesize yellowSmallLED;

@synthesize redLEDNumber2;
@synthesize redLEDNumber3;
@synthesize redLEDNumber4;
@synthesize redLEDNumber5;
@synthesize redLEDNumber6;
@synthesize redLEDNumber7;
@synthesize redLEDNumber8;

@synthesize kvoDemoLED;
@synthesize kvoInvertedDemoLED;
@synthesize notificationDemoLED;

@synthesize sendOnNotificationButton;
@synthesize sendOffNotification;
@synthesize turnButtonStripsOnButton;
@synthesize turnButtonStripsOffButton;	

@synthesize flipFlop;

#pragma mark IBActions
-(IBAction)sendOnNotificationButtonPushed:(id)sender {
	[[NSNotificationCenter defaultCenter] postNotificationName:TULEDIndicatorViewsDemoOnNotification 
														object:self];
}

-(IBAction)sendOffNotificationButtonPushed:(id)sender {
	[[NSNotificationCenter defaultCenter] postNotificationName:TULEDIndicatorViewsDemoOffNotification 
														object:self];
}

-(IBAction)turnButtonStripsOnButtonPushed:(id)sender {
	[self.amberSmallLED switchIndicatorLightOn];
	[self.blueSmallLED switchIndicatorLightOn];
	[self.greenSmallLED switchIndicatorLightOn];
	[self.redSmallLED switchIndicatorLightOn];
	[self.uvSmallLED switchIndicatorLightOn];
	[self.whiteSmallLED switchIndicatorLightOn];
	[self.yellowSmallLED switchIndicatorLightOn];
	
	[self.redLEDNumber2 switchIndicatorLightOn];
	[self.redLEDNumber3 switchIndicatorLightOn];
	[self.redLEDNumber4 switchIndicatorLightOn];
	[self.redLEDNumber5 switchIndicatorLightOn];
	[self.redLEDNumber6 switchIndicatorLightOn];
	[self.redLEDNumber7 switchIndicatorLightOn];
	[self.redLEDNumber8 switchIndicatorLightOn];
}

-(IBAction)turnButtonStripsOffButtonPushed:(id)sender {
	[self.amberSmallLED switchIndicatorLightOff];
	[self.blueSmallLED switchIndicatorLightOff];
	[self.greenSmallLED switchIndicatorLightOff];
	[self.redSmallLED switchIndicatorLightOff];
	[self.uvSmallLED switchIndicatorLightOff];
	[self.whiteSmallLED switchIndicatorLightOff];
	[self.yellowSmallLED switchIndicatorLightOff];
	
	[self.redLEDNumber2 switchIndicatorLightOff];
	[self.redLEDNumber3 switchIndicatorLightOff];
	[self.redLEDNumber4 switchIndicatorLightOff];
	[self.redLEDNumber5 switchIndicatorLightOff];
	[self.redLEDNumber6 switchIndicatorLightOff];
	[self.redLEDNumber7 switchIndicatorLightOff];
	[self.redLEDNumber8 switchIndicatorLightOff];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.flipFlop = [[[TULEDKVOFlipFlop alloc] init] autorelease];
	[self.kvoDemoLED makeUVWatchingKeyPath:@"lightIsOn" 
								  ofObject:self.flipFlop 
								 inverting:NO];
	[self.kvoInvertedDemoLED makeUVWatchingKeyPath:@"lightIsOn" 
										  ofObject:self.flipFlop 
										 inverting:YES];

	[self.amberSmallLED makeAmber];
	[self.blueSmallLED makeBlue];
	[self.greenSmallLED makeGreen];
	[self.redSmallLED makeRed];
	[self.uvSmallLED makeUV];
	[self.whiteSmallLED makeWhite];
	[self.yellowSmallLED makeYellow];
	
	[self.redLEDNumber2 makeRed];
	[self.redLEDNumber3 makeRed];
	[self.redLEDNumber4 makeRed];
	[self.redLEDNumber5 makeRed];
	[self.redLEDNumber6 makeRed];
	[self.redLEDNumber7 makeRed];
	[self.redLEDNumber8 makeRed];
	
	[self.notificationDemoLED makeWhite];
	NSLog(@"self.notificationDemoLED: '%@', '%@'.",self.notificationDemoLED.onIndicatorImage,self.notificationDemoLED.offIndicatorImage);
	[[NSNotificationCenter defaultCenter] addObserver:self.notificationDemoLED 
											 selector:@selector(turnLightSwitchOnNotfication:) 
												 name:TULEDIndicatorViewsDemoOnNotification
											   object:self];
	[[NSNotificationCenter defaultCenter] addObserver:self.notificationDemoLED 
											 selector:@selector(turnLightSwitchOffNotfication:) 
												 name:TULEDIndicatorViewsDemoOffNotification
											   object:self];
	[self.flipFlop launchTimer];
}

- (void)dealloc {
	self.amberSmallLED = nil;
	self.blueSmallLED = nil;
	self.greenSmallLED = nil;
	self.redSmallLED = nil;
	self.uvSmallLED = nil;
	self.whiteSmallLED = nil;
	self.yellowSmallLED = nil;
	
	self.redLEDNumber2 = nil;
	self.redLEDNumber3 = nil;
	self.redLEDNumber4 = nil;
	self.redLEDNumber5 = nil;
	self.redLEDNumber6 = nil;
	self.redLEDNumber7 = nil;
	self.redLEDNumber8 = nil;
	
	self.kvoDemoLED = nil;
	self.kvoInvertedDemoLED = nil;
	self.notificationDemoLED = nil;
	
	self.sendOnNotificationButton = nil;
	self.sendOffNotification = nil;
	self.turnButtonStripsOnButton = nil;
	self.turnButtonStripsOffButton = nil;	

	self.flipFlop = nil;
	
    [super dealloc];
}

@end

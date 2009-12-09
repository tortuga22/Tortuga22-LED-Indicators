//
//  TULEDKVOFlipFlop.m
//  TULEDIndicatorViewsDemo
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import "TULEDKVOFlipFlop.h"


@implementation TULEDKVOFlipFlop

#pragma mark KVO
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
	if ([key isEqualToString:@"lightIsOn"]) {
		return YES;
	} else {
		return [super automaticallyNotifiesObserversForKey:key];
	}

}

@dynamic lightIsOn; // KVO
-(BOOL)lightIsOn {
	return lightIsOn;
}

-(void)setLightIsOn:(BOOL)newValue {
	if (newValue != self.lightIsOn) {
		[self willChangeValueForKey:@"lightIsOn"];
		lightIsOn = newValue;
		[self didChangeValueForKey:@"lightIsOn"];
	}
}

#pragma mark Synthesized Properties
@synthesize currentInterval;
@synthesize remainingFlipFlopsBeforeReroll;

#pragma mark NSTimer Methods
-(void)launchTimer {
	[NSTimer scheduledTimerWithTimeInterval:self.currentInterval 
									 target:self 
								   selector:@selector(handleCallbackFromTimer:) 
								   userInfo:nil
									repeats:NO];
}

-(void)reroll {
	@synchronized(self) {
		self.remainingFlipFlopsBeforeReroll = (rand() % 8) + 3; // 3-10 repetitions
		self.currentInterval = ((((double) rand()) / ((double) RAND_MAX)) * .4f) + .2f;
	}
}

-(void)handleCallbackFromTimer:(NSTimer *)timer {
	@synchronized(self) {
		self.remainingFlipFlopsBeforeReroll -= 1;
		if (self.remainingFlipFlopsBeforeReroll <= 0) {
			[self reroll];
		}
		self.lightIsOn = !self.lightIsOn;
		[timer release]; // NEEDED?
		[NSTimer scheduledTimerWithTimeInterval:self.currentInterval 
										 target:self 
									   selector:@selector(handleCallbackFromTimer:) 
									   userInfo:nil
										repeats:NO];
	}
}

@end

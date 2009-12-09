//
//  TULEDKVOFlipFlop.h
//  TULEDIndicatorViewsDemo
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TULEDKVOFlipFlop : NSObject {
	BOOL lightIsOn; // KVO 
	NSTimeInterval currentInterval;
	NSInteger remainingFlipFlopsBeforeReroll;
}

// Synthesized Properties
@property(nonatomic, assign) BOOL lightIsOn; // KVO
@property(nonatomic, assign) NSTimeInterval currentInterval;
@property(nonatomic, assign) NSInteger remainingFlipFlopsBeforeReroll;

// NSTimer Methods
-(void)launchTimer;
-(void)reroll;
-(void)handleCallbackFromTimer:(NSTimer *)timer;

@end

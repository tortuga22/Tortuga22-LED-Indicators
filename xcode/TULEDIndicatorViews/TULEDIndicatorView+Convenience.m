//
//  TULEDIndicatorView+Convenience
//  TULEDIndicatorViews
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import "TULEDIndicatorView+Convenience.h"
#import	"TULEDImageFileSchema.h"

@implementation TULEDIndicatorView (Convenience)

#pragma mark Convenience Initializers - Manual + NSNotification
-(id)initAsAmberWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorAmber];
}

-(id)initAsBlueWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorBlue];
}

-(id)initAsGreenWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorGreen];
}

-(id)initAsRedWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorRed];
}

-(id)initAsUVWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorUV];
}

-(id)initAsWhiteWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorWhite];
}

-(id)initAsYellowWithFrame:(CGRect)frame {
	return [self initWithFrame:frame color:TULEDColorYellow];
}

#pragma mark -
-(id)initWithFrame:(CGRect)frame color:(NSString *)color {
	TULEDImageFileSchema *shared = [TULEDImageFileSchema shared];
	if (shared) {
		self = [self initWithFrame:frame 
						  offImage:[shared imageForColor:color 
											  activation:NO 
												   width:CGRectGetWidth(frame) 
												  height:CGRectGetHeight(frame)]
						   onImage:[shared imageForColor:color 
											  activation:YES 
												   width:CGRectGetWidth(frame) 
												  height:CGRectGetHeight(frame)]];
	}
	return self;
}

#pragma mark Convenience Initializers - KVO
-(id)initAsAmberWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorAmber
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

-(id)initAsBlueWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorBlue
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

-(id)initAsGreenWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorGreen
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

-(id)initAsRedWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorRed
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

-(id)initAsUVWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorUV
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

-(id)initAsWhiteWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorWhite
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

-(id)initAsYellowWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self initWithFrame:frame 
						 color:TULEDColorYellow 
			   watchingKeyPath:keyPath 
					  ofObject:object 
					 inverting:inverting];
}

#pragma mark -
-(id)initWithFrame:(CGRect)frame color:(NSString *)color watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	TULEDImageFileSchema *shared = [TULEDImageFileSchema shared];
	if (shared) {
		self = [self initWithFrame:frame 
						  offImage:[shared imageForColor:color 
											  activation:NO 
												   width:CGRectGetWidth(frame) 
												  height:CGRectGetHeight(frame)]
						   onImage:[shared imageForColor:color 
											  activation:YES 
												   width:CGRectGetWidth(frame) 
												  height:CGRectGetHeight(frame)]
					 startingState:[[self class] classDefaultIndicatorLightStartsSwitchedOn]
				   watchingKeyPath:keyPath 
						  ofObject:object
						 inverting:inverting];
	}
	return self;
}

#pragma mark Convenience Constructors - Manual and Notification
+(id)amberLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorAmber];
}

+(id)blueLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorBlue];
}

+(id)greenLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorGreen];
}

+(id)redLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorRed];
}

+(id)uvLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorUV];
}

+(id)whiteLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorWhite];
}

+(id)yellowLEDIndicatorWithFrame:(CGRect)frame {
	return [self ledIndicatorWithFrame:frame color:TULEDColorYellow];
}

#pragma mark -
+(id)ledIndicatorWithFrame:(CGRect)frame color:(NSString *)color {
	return [[[self alloc] initWithFrame:frame color:color] autorelease];
}

#pragma mark Convenience Constructors - KVO
+(id)amberLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorAmber 
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

+(id)blueLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorBlue
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

+(id)greenLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorGreen
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

+(id)redLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorRed
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

+(id)uvLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorUV
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

+(id)whiteLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorYellow 
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

+(id)yellowLEDIndicatorWithFrame:(CGRect)frame watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [self ledIndicatorWithFrame:frame 
								 color:TULEDColorYellow 
					   watchingKeyPath:keyPath 
							  ofObject:object 
							 inverting:inverting];
}

#pragma mark -
+(id)ledIndicatorWithFrame:(CGRect)frame color:(NSString *)color watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	return [[[self alloc] initWithFrame:(CGRect)frame 
								  color:color 
						watchingKeyPath:keyPath 
							   ofObject:object 
							  inverting:inverting] autorelease];
}

#pragma mark Convenience Set-Up - Manual + Notification
-(void)makeAmber {
	[self makeColor:TULEDColorAmber];
}

-(void)makeBlue {
	[self makeColor:TULEDColorBlue];
}

-(void)makeGreen {
	[self makeColor:TULEDColorGreen];
}

-(void)makeRed {
	[self makeColor:TULEDColorRed];
}

-(void)makeUV {
	[self makeColor:TULEDColorUV];
}

-(void)makeWhite {
	[self makeColor:TULEDColorWhite];
}

-(void)makeYellow {
	[self makeColor:TULEDColorYellow];
}

#pragma mark -
-(void)makeColor:(NSString *)color {
	TULEDImageFileSchema *shared = [TULEDImageFileSchema shared];
	if (shared) {
		self.offIndicatorImage = [shared imageForColor:color 
											activation:NO 
												 width:CGRectGetWidth(self.bounds) 
												height:CGRectGetHeight(self.bounds)];
		self.onIndicatorImage = [shared imageForColor:color 
										   activation:YES 
												width:CGRectGetWidth(self.bounds) 
											   height:CGRectGetHeight(self.bounds)];
		
	}
	NSLog(@"self: '%@', onImage: '%@', offImage: '%@'.",self,self.onIndicatorImage,self.offIndicatorImage);
	[self setNeedsDisplay];
}

#pragma mark Convenience Set-Up - KVO
-(void)makeAmberWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

-(void)makeBlueWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

-(void)makeGreenWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

-(void)makeRedWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

-(void)makeUVWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

-(void)makeWhiteWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

-(void)makeYellowWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:TULEDColorAmber watchingKeyPath:keyPath ofObject:object inverting:inverting];
}

#pragma mark -
-(void)makeColor:(NSString *)color watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	[self makeColor:color];
	[self registerForWatchingKeyPath:keyPath ofObject:object inverting:inverting];
}

@end

//
//  TULEDIndicatorView.m
//  TULEDIndicatorViews
//
//  Created by Paul Berman on 11/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TULEDIndicatorView.h"


@implementation TULEDIndicatorView

#pragma mark Synthesized Properties
@synthesize indicatorLightIsSwitchedOn = _indicatorLightIsSwitchedOn;
@synthesize invertIndicatorLightActivation = _invertIndicatorLightActivation;
@synthesize offIndicatorImage = _offIndicatorImage;
@synthesize onIndicatorImage = _onIndicatorImage;
@synthesize kvoKeyPath = _kvoKeyPath;
@synthesize monitoredObject = _monitoredObject;

#pragma mark Convenience Properties
@dynamic shouldDrawIndicatorLightAsOn;
-(BOOL)shouldDrawIndicatorLightAsOn {
	return ((self.indicatorLightIsSwitchedOn && (!(self.invertIndicatorLightActivation))) || ((!(self.indicatorLightIsSwitchedOn)) && self.invertIndicatorLightActivation))?(YES):(NO);
}

#pragma mark Init + Dealloc
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage {
	return [self initWithFrame:frame offImage:offImage onImage:onImage startingState:[[self class] classDefaultIndicatorLightIsSwitchedOn]];
}

-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn {
	return [self initWithFrame:frame offImage:offImage onImage:onImage startingState:startsAsOn invertingLightActivation:[[self class] classDefaultInvertIndicatorLightActivation]];
}

-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn invertingLightActivation:(BOOL)inverts {
	NSParameterAssert(offImage != nil);
	NSParameterAssert(onImage != nil);
	if (self = [super initWithFrame:frame]) {
		self.offIndicatorImage = offImage;
		self.onIndicatorImage = onImage;
		self.indicatorLightIsSwitchedOn = startsAsOn;
		self.invertIndicatorLightActivation = inverts;
	}
	return self;
}

#pragma mark -
-(void)dealloc {
	self.onIndicatorImage = nil;
	self.offIndicatorImage = nil;
	[super dealloc];
}

#pragma mark Drawing
-(void)drawOnImageInRect:(CGRect)rect {
	UIImage *onIndicatorImage = [self onIndicatorImage];
	if (onIndicatorImage) {
		[onIndicatorImage drawInRect:rect];
	}
}

-(void)drawOffImageInRect:(CGRect)rect {
	UIImage *offIndicatorImage = [self offIndicatorImage];
	if (offIndicatorImage) {
		[offIndicatorImage drawInRect:rect];
	}
}

#pragma mark Awake From Nib
-(void)awakeFromNib {
	[super awakeFromNib]; 
	self.indicatorLightIsSwitchedOn = [[self class] classDefaultIndicatorLightIsSwitchedOn];
	self.invertIndicatorLightActivation = [[self class] classDefaultInvertIndicatorLightActivation];
}

#pragma mark Class Defaults
+(BOOL)classDefaultIndicatorLightIsSwitchedOn {
	return NO;
}

+(BOOL)classDefaultInvertIndicatorLightActivation {
	return NO;
}

#pragma mark Direct Methods
-(void)switchIndicatorLightOn {
	BOOL currentValue = [self indicatorLightIsSwitchedOn];
	if (!currentValue) {
		[self setIndicatorLightIsSwitchedOn:YES];
		[self setNeedsDisplay];
	}
}

-(void)switchIndicatorLightOff {
	BOOL currentValue = [self indicatorLightIsSwitchedOn];
	if (currentValue) {
		[self setIndicatorLightIsSwitchedOn:NO];
		[self setNeedsDisplay];
	}
}

#pragma mark KVO Observing
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	BOOL handledIt = NO;
	@try {
		if (self.kvoKeyPath && self.monitoredObject && keyPath && object) {
			if ([self.kvoKeyPath isEqualToString:keyPath] && (object == self.monitoredObject)) {
				BOOL newValue = [((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]) boolValue];
				if (newValue) {
					[self switchIndicatorLightOn];
				} else {
					[self switchIndicatorLightOff];
				}
				handledIt = YES;
			}
		}
	}
	@catch (NSException * e) {
		NSLog(@"Exception In: [%@:<%x> observeValueForKeyPath:'%@' ofObject:'%@' change:'%@' context:'%@']: '%@', '%@'.",NSStringFromClass([self class]),((NSUInteger)self),keyPath,object,change,context,[e description],[e userInfo]);
		handledIt = NO;
	}
	@finally {
		if (!handledIt) {
			[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
		}
	}
}

#pragma mark Notification Reaction
-(void)turnLightSwitchOnNotfication:(NSNotification *)notification {
	[self switchIndicatorLightOn];
}

-(void)turnLightSwitchOffNotfication:(NSNotification *)notification {
	[self switchIndicatorLightOff];
}


#pragma mark UIView Overrides
- (void)drawRect:(CGRect)rect {
    // Drawing code: TOOO fix size if partially blocked?
	if ([self shouldDrawIndicatorLightAsOn]) {
		[self drawOnImageInRect:rect];
	} else {
		[self drawOffImageInRect:rect];
	}
}

@end

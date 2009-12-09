//
//  TULEDIndicatorView.m
//  TULEDIndicatorViews
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import "TULEDIndicatorView.h"


@implementation TULEDIndicatorView

#pragma mark UIView Overrides
- (void)drawRect:(CGRect)rect {
    // Drawing code: TOOO fix size if partially blocked?
	if ([self shouldDrawIndicatorLightAsOn]) {
		[self drawOnImageInRect:rect];
	} else {
		[self drawOffImageInRect:rect];
	}
}

#pragma mark Manually-Implemented Properties
@synthesize indicatorLightIsSwitchedOn = _indicatorLightIsSwitchedOn;
-(BOOL)indicatorLightIsSwitchedOn {
	return _indicatorLightIsSwitchedOn;
}

-(void)setIndicatorLightIsSwitchedOn:(BOOL)newValue {
	if (newValue != self.indicatorLightIsSwitchedOn) {
		[self willChangeValueForKey:@"indicatorLightIsSwitchedOn"];
		_indicatorLightIsSwitchedOn = newValue;
		[self didChangeValueForKey:@"indicatorLightIsSwitchedOn"];
		[self setNeedsDisplay];
	}
}

#pragma mark Synthesized Properties
@synthesize invertIndicatorLightActivation = _invertIndicatorLightActivation;
@synthesize offIndicatorImage = _offIndicatorImage;
@synthesize onIndicatorImage = _onIndicatorImage;
@synthesize kvoKeyPath = _kvoKeyPath;
@synthesize monitoredObject = _monitoredObject;

#pragma mark Convenience Properties
@dynamic valueThatTurnsLightOn;
-(BOOL)valueThatTurnsLightOn {
	return (self.invertIndicatorLightActivation)?(NO):(YES);
}

@dynamic valueThatTurnsLightOff;
-(BOOL)valueThatTurnsLightOff {
	return (self.invertIndicatorLightActivation)?(YES):(NO);
}

@dynamic shouldDrawIndicatorLightAsOn;
-(BOOL)shouldDrawIndicatorLightAsOn {
	return ((self.indicatorLightIsSwitchedOn 
			 && (!(self.invertIndicatorLightActivation))) 
			|| ((!(self.indicatorLightIsSwitchedOn)) 
				&& self.invertIndicatorLightActivation))
	?(YES):(NO);
}

#pragma mark Init + Dealloc
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage {
	return [self initWithFrame:frame 
					  offImage:offImage 
					   onImage:onImage 
				 startingState:[[self class] classDefaultIndicatorLightStartsSwitchedOn]];
}

/*!
	@method     initWithFrame:offImage:onImage:startingState:
	@abstract   Designated initializer for manual or NSNotification LED indicators.
	@discussion This is how you initialize an LED Indicator View that's either manually managed or used with the NSNotification system.
 
	@param frame The view's frame, passed through to UIView's initWithFrame: unaltered.
	@param offImage The image for "off", can't be nil.
	@param onImage The image for "on", can't be nil.
	@param startsAsOn Whether the indicator starts in the "ON" mode or not. NB: this takes into consideration your input for "inverts"; if you say startsAsOn=YES you will start with the light on.
 
	@result Newly-initialized TULEDIndicatorView.
 */
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn {
	NSParameterAssert(offImage != nil);
	NSParameterAssert(onImage != nil);
	if (self = [super initWithFrame:frame]) {
		self.onIndicatorImage = onImage;
		self.offIndicatorImage = offImage;
		self.invertIndicatorLightActivation = NO;
		self.indicatorLightIsSwitchedOn = startsAsOn;
		self.monitoredObject = nil;
		self.kvoKeyPath = nil;
	}
	return self;
}

/*!
    @method     initWithFrame:offImage:onImage:startingState:watchingKeyPath:ofObject:inverting:
    @abstract   Use this initializer if you want to create a view that's doing KVO from step #1.
    @discussion This is how you initialize an LED Indicator View.
 
	@param frame The view's frame, passed through to UIView's initWithFrame: unaltered.
	@param offImage The image for "off", can't be nil.
	@param onImage The image for "on", can't be nil.
    @param startsAsOn Whether the indicator starts in the "ON" mode or not. NB: this takes into consideration your input for "inverts"; if you say startsAsOn=YES you will start with the light on.
	@param keyPath The keyPath to use when observing object. Can't be nil.
	@param object The object to use KVO-of-"keyPath" upon. Can't be nil.
	@param inverting If YES, the indicator lights up when it is told to turn the light off and vice-versa. EG: you'd say YES if your UI labels the indicator as "PROBLEM?" but the monitored object's variable means "YES means NO PROBLEM".
 
	@result Newly-initialized TULEDIndicatorView, monitoring keyPath of object.
*/

-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	NSParameterAssert(offImage != nil);
	NSParameterAssert(onImage != nil);
	NSParameterAssert(keyPath != nil);
	NSParameterAssert(object != nil);
	if (self = [super initWithFrame:frame]) {
		self.offIndicatorImage = offImage;
		self.onIndicatorImage = onImage;
		// We respect the intent of "startsAsOn".
		// So if you say "startsAsOn"==YES AND inverts==YES we set the "light switched on" property to NO, etc.
		// ...but if you aren't inverting we pass it through unaltered.
		[self registerForWatchingKeyPath:keyPath ofObject:object inverting:inverting];
		 self.indicatorLightIsSwitchedOn = (startsAsOn)?([self valueThatTurnsLightOn]):([self valueThatTurnsLightOff]);
	}
	return self;
}

#pragma mark -
-(void)dealloc {
	self.onIndicatorImage = nil;
	self.offIndicatorImage = nil;
	[self deregisterForKVO];
	[super dealloc];
}

#pragma mark Drawing
-(void)drawOnImageInRect:(CGRect)rect {
	UIImage *onIndicatorImage = [self onIndicatorImage];
	if (onIndicatorImage) {
		[onIndicatorImage drawInRect:rect];
		//CGContextRef context = UIGraphicsGetCurrentContext();
		//CGContextDrawImage(context, rect, [onIndicatorImage CGImage]);
	}
}

-(void)drawOffImageInRect:(CGRect)rect {
	UIImage *offIndicatorImage = [self offIndicatorImage];
	if (offIndicatorImage) {
		[offIndicatorImage drawInRect:rect];
		//CGContextRef context = UIGraphicsGetCurrentContext();
		//CGContextDrawImage(context, rect, [offIndicatorImage CGImage]);
	}
}

#pragma mark Awake From Nib
-(void)awakeFromNib {
	[super awakeFromNib]; 
	// Newly-awoken indicator views set their ui status to class default.
	self.indicatorLightIsSwitchedOn = [[self class] classDefaultIndicatorLightStartsSwitchedOn];
}

#pragma mark Class Defaults
/*!
 @method     classDefaultIndicatorLightIsSwitchedOn
 @abstract   Used in convenience constructors and in awakeFromNib, override to suit.
 */
+(BOOL)classDefaultIndicatorLightStartsSwitchedOn {
	return NO;
}

#pragma mark Direct Methods
/*!
    @method     switchIndicatorLightOn
    @abstract   Sets indicatorLightIsSwitchedOn to value that results in the onImage being displayed.
    @discussion As discussed in the docs using these methods results in what the method says it'll do, ignoring inversion. If you want to set values in a way that takes inversion into account set the property values directly.
*/
-(void)switchIndicatorLightOn {
	[self setIndicatorLightIsSwitchedOn:[self valueThatTurnsLightOn]];
}

/*!
 @method     switchIndicatorLightOff
 @abstract   Sets indicatorLightIsSwitchedOff to value that results in the offImage being displayed.
 @discussion As discussed in the docs using these methods results in what the method says it'll do, ignoring inversion. If you want to set values in a way that takes inversion into account set the property values directly.
 */
-(void)switchIndicatorLightOff {
	[self setIndicatorLightIsSwitchedOn:[self valueThatTurnsLightOff]];
}

#pragma mark Notification Reaction
-(void)turnLightSwitchOnNotfication:(NSNotification *)notification {
	[self switchIndicatorLightOn];
}

-(void)turnLightSwitchOffNotfication:(NSNotification *)notification {
	[self switchIndicatorLightOff];
}


#pragma mark KVO Observing
/*!
    @method     registerForWatchingKeyPath:ofObject:inverting:
    @abstract   Use to go into KVO-based UI state maintenance.
    @discussion This method looks more complicated than it is.
	
	The behavior is approximately: set up KVO on the passed-in object's property @ keyPath and set the "inverting" behavior to the passed-in "inverting" behavior. If the object is already watching some object and keyPath we will end that observation before setting up the new observation.
 
	There are a couple special cases:
		1. if the passed-in object and keyPath are already being observed we check if the inverting preference is different. If so we update the inverting preference and redraw-if-needed. This is DIFFERENT from what would happen if you directly set the invertIndicatorLightActivation property.
		2. if something goes wrong setting up observation on the new object we stop trying to watch it and set the view state back to what it was; WE DON'T SET OBSERVATION back to being the previous object. This is personal preference: if I'm trying to make an indicator start watching B instead of A I want it to either start watching B or lock up; I don't want it to keep watching A due to something being faulty with B.
	
	The code is simpler than it looks if you keep those goals in mind.
*/

-(void)registerForWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting {
	if (self.monitoredObject == object) {
		if (object && inverting != self.invertIndicatorLightActivation) {
			self.invertIndicatorLightActivation;
			[self setNeedsDisplay];
		}
	} else {
		if (self.monitoredObject) {
			[self deregisterForKVO];
		}
		if (object && keyPath) {
			BOOL currentIndicatorState = self.indicatorLightIsSwitchedOn;
			@try {
				[object addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
				self.monitoredObject = object;
				self.kvoKeyPath = keyPath;
				self.invertIndicatorLightActivation = inverting;
				self.indicatorLightIsSwitchedOn = [((NSNumber *)[self.monitoredObject valueForKey:self.kvoKeyPath]) boolValue];
			}
			@catch (NSException * e) {
				// if something goes wrong we (1) revert to previous state and (2) stop observing stuff
				self.monitoredObject = nil;
				self.kvoKeyPath = nil;
				self.invertIndicatorLightActivation = NO;
				self.indicatorLightIsSwitchedOn = currentIndicatorState;
				[self deregisterForKVOKeyPath:keyPath ofObject:object];
			}
		}
	}
}

-(void)deregisterForKVOKeyPath:(NSString *)keyPath ofObject:(id)object {
	if (keyPath && object) {
		@try {
			[object removeObserver:self forKeyPath:keyPath];
		}
		@catch (NSException * e) {
			;
		}
	}
}

-(void)deregisterForKVO {
	[self deregisterForKVOKeyPath:[self kvoKeyPath] ofObject:[self monitoredObject]];
	self.kvoKeyPath = nil;
	self.monitoredObject = nil;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	BOOL handledIt = NO;
	@try {
		if (self.kvoKeyPath && self.monitoredObject && keyPath && object) {
			if ([self.kvoKeyPath isEqualToString:keyPath] 
				&& (object == self.monitoredObject)) {
				BOOL newValue = [((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]) boolValue];
				[self setIndicatorLightIsSwitchedOn:newValue];
				handledIt = YES;
			}
		}
	}
	@catch (NSException * e) {
		handledIt = NO;
	}
	@finally {
		if (!handledIt) {
			[super observeValueForKeyPath:keyPath 
								 ofObject:object 
								   change:change 
								  context:context];
		}
	}
}

@end

//
//  TULEDIndicatorView.h
//  TULEDIndicatorViews
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
	@class       TULEDIndicatorView
	@abstract    A UIView implementing an LED indicator that can be on or off.
	@discussion  This LED indicator view is itself exceedingly simple: it has an image for "ON" and an image for "OFF" and will draw the appropriate image. 
 
	The class is intended to be easy to use, robust, and flexible. You can set it up to behave in one of three ways:
 
	1. It can be manually triggered via methods that directly turn the light on and off.
    2. It can be configured to respond to NSNotifications from NSNotificationCenter and react appropriately.
    3. It can be configured to monitor a BOOL on another object via KVO and automatically switch on/off in response to KVO updates.
 
    The latter two options make the class convenient for adding lightweight "Internet Available?" indicators (or other similar status indicators) without too much direct coupling between view code and the status code: the LED indicator's view controller just has to register the LED to receive notifications or do KVO and then the UI will update appropriately.
 
	In this file only the class's core functionality is implemented. This library ships with some built-in images, and in the TULEDIndicatorView-Convenience category you'll find convenience methods to help use the included images.
*/

@interface TULEDIndicatorView : UIView {
	BOOL _indicatorLightIsSwitchedOn;
	BOOL _invertIndicatorLightActivation;
	UIImage *_offIndicatorImage;
	UIImage *_onIndicatorImage;
	NSString *_kvoKeyPath;
	IBOutlet id _monitoredObject;
}

// Manually Implemented Properties
/*!
	@property indicatorLightIsSwitchedOn
 
	Internal variable. Should not use this property directly unless you've read the docs; use switchIndicatorLightOn/switchIndicatorLightOff instead.
 
	Changing this value will result in the view requesting redraw.
 */
@property(nonatomic, assign) BOOL indicatorLightIsSwitchedOn;

// Synthesized Properties
/*!
	@property invertIndicatorLightActivation
 
	When this is "NO" the meaning of "indicatorLightIsSwitchedOn" is that YES=>light is drawn with onImage and NO=>light is drawn with offImage.
 
	When this is "YES" the meaning of "indicatorLightIsSwitchedOn" is that YES=>light drawn as off and NO=>light is drawn as on.
 
	Shouldn't set directly except inside of awakeWithNib or viewDidLoad or similar, as changing the value won't automatically trigger a change in view state.
 */
@property(nonatomic, assign) BOOL invertIndicatorLightActivation;
/*!
	@property offIndicatorImage
 
	Image used to draw the view when it is "off"; if this is nil the view does nothing when drawing itself in "off" state.
 
	Shouldn't be set directly except inside of awakeWithNib or viewDidLoad; changing value here won't trigger a view update.
 */
@property(nonatomic, retain) UIImage *offIndicatorImage;

/*!
 @property onIndicatorImage
 
 Image used to draw the view when it is "on"; if this is nil the view does nothing when drawing itself in "on" state.
 
 Shouldn't be set directly except inside of awakeWithNib or viewDidLoad; changing value here won't trigger a view update.
 */
@property(nonatomic, retain) UIImage *onIndicatorImage;

/*!
 @property kvoKeyPath
 
 When doing KVO monitoring the observed keypath must match this string or else the observation is ignored.
 
 Shouldn't set directly, use the registerForWatchingKeyPath:ofObject:inverting: method instead.

 */
@property(nonatomic, retain) NSString *kvoKeyPath;

/*!
	@property monitoredObject
 
	When doing KVO monitoring the observed object must equal this (pointer comparison) or else the observation is ignored.

	Shouldn't set directly, use the registerForWatchingKeyPath:ofObject:inverting: method instead.

 */
@property(nonatomic, assign) id monitoredObject;

// Convenience Properties
@property(nonatomic, readonly) BOOL valueThatTurnsLightOn;
@property(nonatomic, readonly) BOOL valueThatTurnsLightOff;
@property(nonatomic, readonly) BOOL shouldDrawIndicatorLightAsOn;

// Init For Manual or Notification
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage;
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn;

// Init For KVO
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn watchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)dealloc;

// Drawing
-(void)drawOnImageInRect:(CGRect)rect;
-(void)drawOffImageInRect:(CGRect)rect;

// Awake From Nib
-(void)awakeFromNib;

// Class Defaults
+(BOOL)classDefaultIndicatorLightStartsSwitchedOn;

// Direct Methods
-(void)switchIndicatorLightOn;
-(void)switchIndicatorLightOff;

// Notification Reaction
-(void)turnLightSwitchOnNotfication:(NSNotification *)notification;
-(void)turnLightSwitchOffNotfication:(NSNotification *)notification;

// KVO Observing
-(void)registerForWatchingKeyPath:(NSString *)keyPath ofObject:(id)object inverting:(BOOL)inverting;
-(void)deregisterForKVOKeyPath:(NSString *)keyPath ofObject:(id)object;
-(void)deregisterForKVO;	
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

@end
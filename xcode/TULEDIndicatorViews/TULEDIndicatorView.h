//
//  TULEDIndicatorView.h
//  TULEDIndicatorViews
//
//  Created by Paul Berman on 11/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TULEDIndicatorView : UIView {
	BOOL _indicatorLightIsSwitchedOn;
	BOOL _invertIndicatorLightActivation;
	UIImage *_offIndicatorImage;
	UIImage *_onIndicatorImage;
	NSString *_kvoKeyPath;
	IBOutlet id _monitoredObject;
}

// Synthesized Properties
@property(nonatomic, assign) BOOL indicatorLightIsSwitchedOn;
@property(nonatomic, assign) BOOL invertIndicatorLightActivation;
@property(nonatomic, retain) UIImage *offIndicatorImage;
@property(nonatomic, retain) UIImage *onIndicatorImage;
@property(nonatomic, retain) NSString *kvoKeyPath;
@property(nonatomic, assign) id monitoredObject;

// Convenience Properties
@property(nonatomic, readonly) BOOL shouldDrawIndicatorLightAsOn;

// Init + Dealloc
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage;
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn;
-(id)initWithFrame:(CGRect)frame offImage:(UIImage *)offImage onImage:(UIImage *)onImage startingState:(BOOL)startsAsOn invertingLightActivation:(BOOL)inverts;
-(void)dealloc;

// Drawing
-(void)drawOnImageInRect:(CGRect)rect;
-(void)drawOffImageInRect:(CGRect)rect;

// Awake From Nib
-(void)awakeFromNib;

// Class Defaults
+(BOOL)classDefaultIndicatorLightIsSwitchedOn;
+(BOOL)classDefaultInvertIndicatorLightActivation;

// Direct Methods
-(void)switchIndicatorLightOn;
-(void)switchIndicatorLightOff;

// KVO Observing
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

// Notification Reaction
-(void)turnLightSwitchOnNotfication:(NSNotification *)notification;
-(void)turnLightSwitchOffNotfication:(NSNotification *)notification;

@end

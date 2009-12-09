DETAILS

Tortuga LED Indicators is a library you can drop into a project and use to create simple LED-looking on/off indicators (like a power light or connectivity indicator).

That's it.

The library gives you three options for controlling the LEDs:

1. Manually switching them on-and-off.
2. Using NSNotificationCenter to link notifications to actions that turn the lights on and off
3. Using KVO to have the LED monitor some keypath on some other variable

...so integrating this code into an existing application's views won't require heavy lifting. The views use prerendered PNGs and will include convenience methods that will automatically select the appropriately-sized raw images to use.


USING IT

To use this library in your project you need to do two things.

#1: Include it as a subproject.

Rather than give a tutorial I am going to link you here:

http://www.clintharris.net/2009/iphone-app-shared-libraries/

...which is an extremely helpful writeup as to how to do exactly that.

#2: Include TULEDs.bundle as a resource in your project. Be sure to have it listed under the "Copy Bundle Resources" build phase for any project output that is using this library. If you don't do this your project will lack the png LED images it needs to use this library.

CODE SAMPLES

I recommend reading the list of methods defined in "TULEDIndicatorView+Convenience.h".

Briefly: suppose we had a class TULEDInternetConnectionMonitor. When created it'd check if internet access was available; when access was available it'd set connectionAvailable to YES and otherwise it'd set it to NO. It's KVO compliant for @"connectionAvailable".

We want to use TULEDIndicatorView to show if the internet is available. Here's what it takes:

@interface TULEDViewController : UIViewController {
	IBOutlet TULEDIndicatorView *connectionAvailableIndicator;
	TULEDInternetConnectionMonitor *connectionMonitor; 
}

//
@property(nonatomic) TULEDIndicatorView *connectionAvailableIndicator;
@property(nonatomic) TULEDInternetConnectionMonitor *connectionMonitor;

@end

@implementation TULEDViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	self.connectionMonitor = [TULEDInternetConnectionMonitor defaultConnectionMonitor];
	[self.connectionAvailableIndicator makeGreenWatchingKeyPath:@"connectionAvailableIndicator" 
	                                                   ofObject:self.connectionMonitor 
	                                                  inverting:NO];
}

@end

...if you were creating the view programmatically you'd do this instead:

self.connectionAvailableIndicator = [TULEDIndicatorView greenLEDIndicatorWithFrame:frame
                                                                   watchingKeyPath:@"connectionAvailable" 
                                                                          ofObject:self.connectionMonitor
                                                                         inverting:NO];

...if instead you had been saddled with a legacy class that had a "problemWithInternet" property you'd do this instead:

self.connectionAvailableIndicator = [TULEDIndicatorView greenLEDIndicatorWithFrame:frame
                                                                   watchingKeyPath:@"connectionAvailable" 
                                                                          ofObject:self.connectionMonitor
                                                                         inverting:YES];

...as setting inverting==YES means that for purposes of KVO-driven updates the LED Indicator treats a YES @ the monitored keyPath as a NO and vice-versa; this lets you avoid having to extend or rewrite pre-existing code to get it to work correctly with the LED Indicator.

For manually-driven state changes you don't use invert; if you're wiring things up by hand wire them up right.

MORE INFO

The TULEDIndicatorViewsDemo has some simple example code showing how to use TULEDIndicatorViews in your project. Read the source to see how everything works, and run it in the simulator to see how the LEDs look.



FAQ:

Q1: Why is no image showing or the app crashing?
A1: Perhaps you forgot to include the TULEDs.bundle into your application? Or included it but forgot to have it copied into the application bundle?

Q2: What colors have you?
A2: Amber, Blue, Green, Red, Ultraviolet (purple), Yellow, White.

CREDITS:

The bundled LED images are by Stuart Brown ( http://rtbrown.com ), originally made available here: http://modernl.com/article/led-icons . Their inclusion is courtesy of his gracious generosity.


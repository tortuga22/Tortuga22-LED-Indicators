//
//  TULEDImageFileSchema
//  TULEDIndicatorViews
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import "TULEDImageFileSchema.h"

@implementation TULEDImageFileSchema

#pragma mark Singleton Constructor
/*!
    @method     shared
    @abstract   Returns the single shared instance of this class, creating if needed.
    @discussion You should use this method to get at a concrete instance of this class.
*/

+(TULEDImageFileSchema *)shared {
	static TULEDImageFileSchema *shared;
	if (!shared) {
		shared = [[self alloc] init];
	}
	return shared;
}

#pragma mark Bundle Lookup
/*!
    @method loadBundle
    @abstract Loads and caches the bundle containing the LED icon pngs files.
    @discussion 
		
		Looks in mainBundle for bundle named as specified in classDefaultBundleName; if it finds a bundle with that name it returns it. 
 
		Keeps around the NSBundle as a static reference and subsequent calls return the cached reference, if any.
 
		Is smart enough to *not* try again to load the bundle if something goes wrong in the load.
 
	@result An NSBundle believed to contain the images or nil if there's an error.
*/
-(NSBundle *)loadBundle {
	static NSBundle *loadBundle;
	static BOOL cannotLoadBundle;
	if ((loadBundle == nil) && (!cannotLoadBundle)) {
		@try {
			NSString *targetBundleName = [[self class] classDefaultBundleName];
			if (targetBundleName) {
				NSBundle *mainBundle = [NSBundle mainBundle];
				if (mainBundle) {
					NSString *pathToBundle = [mainBundle pathForResource:targetBundleName ofType:@".bundle"];
					if (pathToBundle) {
						loadBundle = [[NSBundle alloc] initWithPath:pathToBundle];
					}
				}
			} else {
				cannotLoadBundle = YES;
			}

		}
		@catch (NSException * e) {
			loadBundle = nil;
			cannotLoadBundle = YES;
		}		
	}
	return loadBundle;
}

#pragma mark Filename Lookups
/*!
    @method  filenameForImageForColor:activation:width:height:
    @abstract   Calls through to filenameForImageForColor:activation:width:height:includeExtension with includeExtension==NO.
*/
-(NSString *)filenameForImageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height {
	return [self filenameForImageForColor:color activation:isOn width:width height:height includeExtension:NO];
}

/*!
 @method  filenameForImageForColor:activation:width:height:includeExtension
 @abstract Returns filename of most-appropriate image given parameters.
 @discussion The important thing is that it tries to select an appropriately-sized image based on the width and height you've specified. 
 
 Appropriate means: if the image is <= 256px on its widest side use the smallest available image that's larger than the largest size (eg: a 33px square uses the 48px image); otherwise default to the largest image available (256px).
 
 The stock TULEDImageFileSchema implementation only has square LEDs; passing separate width+height params is in case of future expansion into other indicator styles.
 
 @param color The name of the color. Can't be nil. Use the constants defined in the header like TULEDRedColor.
 @param activation isOn Pass "YES" for the 'on' image and "NO" otherwise.
 @param width The width of the relevant usage site.
 @param height The width of the relevant usage site.
 @param includeExtension Whether returned filename should end in .png or not. Pass "YES" to include .png and "NO" otherwise.
 
 @result Filename for the parameters (eg: red-on-256) or nil if any errors arose.
 
 */
-(NSString *)filenameForImageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height includeExtension:(BOOL)includeExtension {
	NSString *filenameForImageForColor = nil;
	if (color) {
		@try {
			CGFloat largerDimension = (width < height)?(height):(width);
			NSInteger effectiveSize = 256;
			// we want the smallest available image larger than the use site
			// ...so that if the image is scaled it's scaled down, not up
			if (largerDimension <= 16.0f) {
				effectiveSize = 16;
			} else if (largerDimension <= 32.0f) {
				effectiveSize = 32;
			} else if (largerDimension <= 48.0f) {
				effectiveSize = 48;
			} else if (largerDimension <= 64.0f) {
				effectiveSize = 64;
			} else if (largerDimension <= 128.0f) {
				effectiveSize = 128;
			}
			if (includeExtension) {
				filenameForImageForColor = [NSString stringWithFormat:@"%@-%@-%d.png",color,TULEDOnOffStringOfBool(isOn),effectiveSize];
			} else {
				filenameForImageForColor = [NSString stringWithFormat:@"%@-%@-%d",color,TULEDOnOffStringOfBool(isOn),effectiveSize];
			}
		}
		@catch (NSException * e) {
			filenameForImageForColor = nil;
		}
	}
	return filenameForImageForColor;
}

#pragma mark Filepath Lookup
/*!
    @method     pathForExtensionlessFilename:inBundle:
    @abstract   Get full path for specified filename in specified bundle.
    @discussion Gets path for the passed-in filename, which must be in the passed-in bundle.
 
	@param filename Filename we want the path for. Should NOT include file extension.
    @param bundle Bundle we think the file is in.
 
	@result Full filesystem path for filename or nil in case of error.
*/
-(NSString *)pathForExtensionlessFilename:(NSString *)filename inBundle:(NSBundle *)bundle {
	NSString *pathForExtensionlessFilename = nil;
	if (filename && bundle) {
		@try {
			pathForExtensionlessFilename = [bundle pathForResource:filename ofType:@"png"];
		}
		@catch (NSException * e) {
			pathForExtensionlessFilename = nil;
		}
	}
	return pathForExtensionlessFilename;
}

#pragma mark Filepath Lookup - Convenience
/*!
    @method     pathForImageForColor:activation:width:height:
    @abstract   Convenience: gets path, auto-handles bundle-loading and filename-lookup.
    @discussion This looks up the correct filename, loads the bundle, looks for the filepath in the bundle, and then returns the results. No functionality not already implemented in previous methods, but more convenient.
 
	@param color Name of color to look for.
	@param isOn Supply "YES" for "on" and "NO" for "off".
	@param width Width of target use site.
	@param height Height of target use site.
 
	@result Full filepath to specified image or nil if errors.
*/
-(NSString *)pathForImageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height {
	NSString *pathForImageForColor = nil;
	NSBundle *targetBundle = [self loadBundle];
	if (pathForImageForColor) {
		@try {
			pathForImageForColor = [self pathForExtensionlessFilename:[self filenameForImageForColor:color 
																						  activation:isOn 
																							   width:width 
																							  height:height] 
															 inBundle:targetBundle];
		}
		@catch (NSException * e) {
			pathForImageForColor = nil;
		}
	}
	return pathForImageForColor;
}

#pragma mark Image Loading - Convenience
/*!
    @method imageForColor:activation:width:height:    
    @abstract   Loads the specified image using UIImage's imageWithContentsOfFile:.
    @discussion A convenience. It goes through all the intermediate steps of looking up the filename, loading the bundle, and getting the full filepath, and then creating the UIImage.
 
    Note that this uses imageWithContentsOfFile: and implements no caching.
 
	If you want to reduce memory footprint by re-using loaded images you must do so yourself.
 
	@result The specified image or nil if error.
*/
-(UIImage *)imageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height {
	UIImage *imageForColor = nil;
	NSString *pathForImageForColor = [self pathForImageForColor:color activation:isOn width:width height:height];
	if (pathForImageForColor) {
		@try {
			imageForColor = [UIImage imageWithContentsOfFile:pathForImageForColor];
		}
		@catch (NSException * e) {
			imageForColor = nil;
		}
	}
	return imageForColor;
}

#pragma mark Class Defaults
/*!
    @method     classDefaultBundleName
    @abstract   Returns the name of the bundle the class is looking for.
*/

+(NSString *)classDefaultBundleName {
	return TULEDClassDefaultBundleName;
}

@end
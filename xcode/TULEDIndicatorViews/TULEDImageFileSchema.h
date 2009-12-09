//
//  TULEDImageFileSchema.h
//  TULEDIndicatorViews
//
//  Copyright 2009 Tortuga 22, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define TULEDColorAmber (@"amber")
#define TULEDColorBlue (@"blue")
#define TULEDColorGreen (@"green")
#define TULEDColorRed (@"red")
#define TULEDColorYellow (@"yellow")
#define TULEDColorUV (@"uv")
#define TULEDColorWhite (@"white")

#define TULEDOnOffStringOfBool(INPUT) (( INPUT )?(@"on"):(@"off"))

#define TULEDClassDefaultBundleName (@"TULEDs")

/*!
    @class       TULEDImageFileSchema
    @abstract    File Schema for the stock LED image files.
    @discussion  This class is used to programmatically get at the image files needed for TULEDIndicatorView. 
 
	It's admittedly somewhat overkill for just this LED class, and is part of a larger body of code not-yet ready to be open-sourced.
 
	It would be possible to either subclass this implementation or implement your own implementation of TULEDImageFileSchema to replace the stock LED image files if you wanted.
*/

@interface TULEDImageFileSchema : NSObject {
}

// Singleton Constructor
+(TULEDImageFileSchema *)shared;

// Bundle Lookup
-(NSBundle *)loadBundle;

// Filename Lookups
-(NSString *)filenameForImageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height;
-(NSString *)filenameForImageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height includeExtension:(BOOL)includeExtension;

// Filepath Lookup
-(NSString *)pathForExtensionlessFilename:(NSString *)filename inBundle:(NSBundle *)bundle;

// Filepath Lookup - Convenience
-(NSString *)pathForImageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height;

// Image Loading - Convenience
-(UIImage *)imageForColor:(NSString *)color activation:(BOOL)isOn width:(CGFloat)width height:(CGFloat)height;

// Class Defaults
+(NSString *)classDefaultBundleName;

@end

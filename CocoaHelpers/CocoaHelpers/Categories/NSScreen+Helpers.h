//
//  NSScreen+Helpers.h
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSScreen (Helpers)

+ (NSRect)allScreensFrame;
+ (NSScreen *)currentScreenForMouseLocation;
+ (NSScreen *)screenWithNumber:(NSNumber *)screenId;
- (NSNumber *)screenNumber;

@end

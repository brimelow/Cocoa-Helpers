//
//  NSScreen+Helpers.m
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import "NSScreen+Helpers.h"

@implementation NSScreen (Helpers)

+ (NSRect)allScreensFrame
{
    
    NSArray *screens = nil;
    NSScreen *currentScreen = nil;
    NSRect result;
    
    result = NSZeroRect;
    
    screens = [NSScreen screens];
    
    for (currentScreen in screens)
        result = NSUnionRect(result, [currentScreen frame]);
    
    return result;
}

+ (NSScreen *)currentScreenForMouseLocation
{
    NSPoint mouseLocation = [NSEvent mouseLocation];
    
    NSEnumerator *screenEnumerator = [[NSScreen screens] objectEnumerator];
    NSScreen *screen;
    while ((screen = [screenEnumerator nextObject]) &&
           !NSMouseInRect(mouseLocation, screen.frame, NO));
    
    return screen;
}

- (NSNumber *)screenNumber
{
	return [[self deviceDescription] objectForKey:@"NSScreenNumber"];
}

+ (NSScreen *)screenWithNumber:(NSNumber *)screenId
{
	for(NSScreen* each in [NSScreen screens])
	{
		if([screenId isEqual:[each screenNumber]])
		{
			return each;
		}
	}

	return nil;
}

@end

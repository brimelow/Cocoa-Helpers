//
//  NSImage+Helpers.m
//  CocoaHelpers
//
//  Created by Lee Brimelow on 5/9/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import "NSImage+Helpers.h"

@implementation NSImage (Helpers)

- (NSImage *)tintedImageWithColor:(NSColor *)tint operation:(NSCompositingOperation)op
{
    NSSize size = [self size];
    
    NSRect imageBounds = NSMakeRect(0, 0, size.width, size.height);
    
    NSImage *newImage = [[NSImage alloc] initWithSize:size];
    
    [newImage lockFocus];
    [self compositeToPoint:NSZeroPoint operation:NSCompositeSourceOver];
    [tint set];
    NSRectFillUsingOperation(imageBounds, op);
    [newImage unlockFocus];
    
    return newImage;
}

@end

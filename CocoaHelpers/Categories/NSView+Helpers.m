//
//  NSView+Helpers.m
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import "NSView+Helpers.h"

@implementation NSView (Helpers)

- (NSImage *)imageOfView
{
    NSBitmapImageRep *imageRep = [self bitmapImageRepForCachingDisplayInRect:self.bounds];
    [imageRep setSize:self.bounds.size];
    
    [self cacheDisplayInRect:self.bounds toBitmapImageRep:imageRep];
    
    NSImage* image = [[NSImage alloc] initWithSize:self.bounds.size];
    [image addRepresentation:imageRep];
    
    return image;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    [self setWantsLayer:YES];
    self.layer.backgroundColor = backgroundColor.CGColor;
}

@end

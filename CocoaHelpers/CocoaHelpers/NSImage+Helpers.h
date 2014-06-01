//
//  NSImage+Helpers.h
//  CocoaHelpers
//
//  Created by Lee Brimelow on 5/9/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (Helpers)

- (NSImage *)tintedImageWithColor:(NSColor *)tint operation:(NSCompositingOperation)op;

@end

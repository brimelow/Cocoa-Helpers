//
//  SimpleButton.h
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol SimpleButtonDelegate <NSObject>

- (void)simpleButtonClicked:(NSEvent *)event from:(id)sender;

@end

@interface SimpleButton : NSView

@property (nonatomic, strong) NSString *title;
@property (weak) id<SimpleButtonDelegate> delegate;

- (void)setNormalGradient:(NSColor *)startColor endColor:(NSColor *)endColor;
- (void)setHoverStateGradient:(NSColor *)startColor endColor:(NSColor *)endColor;
- (void)setPressedGradient:(NSColor *)startColor endColor:(NSColor *)endColor;

- (void)setBorderColor:(NSColor *)color width:(CGFloat)width;

- (void)setFontAttributesWithFont:(NSFont *)font color:(NSColor *)fontColor;
- (void)setTitlePosition:(NSPoint)titlePosition;

- (void)setIconImage:(NSImage *)icon;
- (void)setIconFrame:(NSRect)iconRect;

@end

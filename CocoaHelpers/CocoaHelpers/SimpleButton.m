//
//  SimpleButton.m
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import "SimpleButton.h"

static NSColor *defaultNormalStartColor;
static NSColor *defaultNormalEndColor;
static NSColor *defaultHoverStartColor;
static NSColor *defaultHoverEndColor;
static NSColor *defaultPressedStartColor;
static NSColor *defaultPressedEndColor;
static NSColor *defaultBorderColor;

@implementation SimpleButton
{
    BOOL _selected;
    BOOL _hovered;
    NSColor *_normalStartColor;
    NSColor *_normalEndColor;
    NSColor *_hoverEndColor;
    NSColor *_hoverStartColor;
    NSColor *_pressedEndColor;
    NSColor *_pressedStartColor;
    NSFont *_font;
    NSColor *_fontColor;
    NSColor *_borderColor;
    CGFloat _borderWidth;
    NSPoint _titlePosition;
    NSImage *_iconImage;
    NSRect _iconRect;
}

+ (void)initialize
{
    defaultNormalStartColor = [NSColor colorWithCalibratedRed: 0.992 green: 0.992 blue: 0.992 alpha: 1];
    defaultNormalEndColor = [NSColor colorWithCalibratedRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    
    defaultHoverStartColor = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    defaultHoverEndColor = [NSColor colorWithCalibratedRed: 0.913 green: 0.964 blue: 1 alpha: 1];
    
    defaultPressedStartColor = [NSColor colorWithCalibratedRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    defaultPressedEndColor = [NSColor colorWithCalibratedRed: 0.992 green: 0.992 blue: 0.992 alpha: 1];
    
    defaultBorderColor = [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0 alpha: 0.3];
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _selected = NO;
        _hovered = NO;
        _title = @"Cool Button";
        _normalStartColor = defaultNormalStartColor;
        _normalEndColor = defaultNormalEndColor;
        _hoverStartColor = defaultHoverStartColor;
        _hoverEndColor = defaultHoverEndColor;
        _pressedStartColor = defaultPressedStartColor;
        _pressedEndColor = defaultPressedEndColor;
        
        NSTrackingArea *area = [[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingActiveAlways | NSTrackingMouseEnteredAndExited owner:self userInfo:nil];
        [self addTrackingArea:area];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	NSColor *startColorForDrawing;
    NSColor *endColorForDrawing;
    
    if (_selected) {
        startColorForDrawing = _pressedStartColor;
        endColorForDrawing = _pressedEndColor;
    }
    else if(_hovered) {
        startColorForDrawing = _hoverStartColor;
        endColorForDrawing = _hoverEndColor;
    }
    else {
        startColorForDrawing = _normalStartColor;
        endColorForDrawing = _normalEndColor;
    }
    
    NSRect topLineRect = NSInsetRect([self bounds], 1, 1);
    
    // inline top white highlight
    NSBezierPath *whiteLine = [NSBezierPath bezierPathWithRoundedRect:topLineRect xRadius:4 yRadius:4];
    
    [[NSColor whiteColor] set];
    [whiteLine fill];
    
    NSRect inlineInsetRect = topLineRect;
    inlineInsetRect.size.height -= 1;
    
    // inline fill
    NSGradient *inlineGradient = [[NSGradient alloc] initWithColorsAndLocations:startColorForDrawing, 0.0, endColorForDrawing, 1.0, nil];
    
    NSBezierPath *inlinePath = [NSBezierPath bezierPathWithRoundedRect:inlineInsetRect xRadius:4 yRadius:4];
    
    [inlineGradient drawInBezierPath:inlinePath angle:-90];
    
    [defaultBorderColor setStroke];
    [inlinePath stroke];
    
    // title
    NSMutableDictionary *titleAttributes = [[NSMutableDictionary alloc] init];
    
    if (_font) {
        [titleAttributes setValue:_font forKey:NSFontAttributeName];
    }
    else
    {
        [titleAttributes setValue:[NSFont fontWithName:@"LucidaGrande" size:14] forKey:NSFontAttributeName];
    }
    
    if (_fontColor) {
        [titleAttributes setValue:_fontColor forKey:NSForegroundColorAttributeName];
    }
    else {
        [titleAttributes setValue:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
    }
    
    NSSize titleSize = [[self title] sizeWithAttributes:titleAttributes];
    CGFloat verticalPoint = ([self bounds].size.height / 2) - (titleSize.height / 2);
    
    CGFloat horizontalPoint = ([self bounds].size.width / 2) - (titleSize.width / 2);
    
    [[self title] drawAtPoint:NSMakePoint(horizontalPoint, verticalPoint) withAttributes:titleAttributes];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self setNeedsDisplay:YES];
}

- (void)setNormalGradient:(NSColor *)startColor endColor:(NSColor *)endColor
{
    _normalStartColor = startColor;
    _normalEndColor = endColor;
    [self setNeedsDisplay:YES];
}

- (void)setHoverStateGradient:(NSColor *)startColor endColor:(NSColor *)endColor
{
    _hoverStartColor = startColor;
    _hoverEndColor = endColor;
    [self setNeedsDisplay:YES];
}

- (void)setPressedGradient:(NSColor *)startColor endColor:(NSColor *)endColor
{
    _pressedStartColor = startColor;
    _pressedEndColor = endColor;
    [self setNeedsDisplay:YES];
}

- (void)setBorderColor:(NSColor *)color width:(CGFloat)width
{
    _borderColor = color;
    _borderWidth = width;
    [self setNeedsDisplay:YES];
}

- (void)setFontAttributesWithFont:(NSFont *)font color:(NSColor *)fontColor
{
    _font = font;
    _fontColor = fontColor;
    [self setNeedsDisplay:YES];
}

- (void)setTitlePosition:(NSPoint)titlePosition
{
    _titlePosition = titlePosition;
}

- (void)setIconImage:(NSImage *)icon
{
    _iconImage = icon;
}

- (void)setIconFrame:(NSRect)iconRect
{
    _iconRect = iconRect;
}

- (void)mouseDown:(NSEvent *)theEvent
{
    _selected = YES;
    [self setNeedsDisplay:YES];
    
    if ([_delegate respondsToSelector:@selector(simpleButtonClicked:from:)]) {
        [_delegate simpleButtonClicked:theEvent from:self];
    }
}

- (void)mouseUp:(NSEvent *)theEvent
{
    _selected = NO;
    [self setNeedsDisplay:YES];
}

- (void)mouseEntered:(NSEvent *)theEvent
{
    _hovered = YES;
    [self setNeedsDisplay:YES];
    [[NSCursor pointingHandCursor] set];
}

- (void)mouseExited:(NSEvent *)theEvent
{
    _hovered = NO;
    [self setNeedsDisplay:YES];
    [[NSCursor arrowCursor] set];
}

@end

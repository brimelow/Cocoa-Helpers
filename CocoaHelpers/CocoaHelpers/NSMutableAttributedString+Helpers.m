//
//  NSAttributedString+Helpers.m
//  DesignFinder
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import "NSMutableAttributedString+Helpers.h"

@implementation NSMutableAttributedString (Helpers)

+ (NSAttributedString *)createWithString:(NSString *)string
                                fontName:(NSString *)fontName
                                    size:(CGFloat)size
                                   color:(NSColor *)color
{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attStr addAttribute:NSForegroundColorAttributeName value:color
                   range:NSMakeRange(0, attStr.length)];
    [attStr addAttribute:NSFontAttributeName value:[NSFont fontWithName:fontName size:size]
                   range:NSMakeRange(0, attStr.length)];
    return attStr;
}

@end

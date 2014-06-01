//
//  NSAttributedString+Helpers.h
//  DesignFinder
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Helpers)

+ (NSMutableAttributedString *)createWithString:(NSString *)string
                                fontName:(NSString *)fontName
                                    size:(CGFloat)size
                                   color:(NSColor *)color;

@end

//
//  NSString+Helpers.h
//  CocoaHelpers
//
//  Created by Lee Brimelow on 5/13/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAffineTransform (RectMapping)

/* initialize the NSAffineTransform so it maps points in
 srcBounds proportionally to points in dstBounds */
- (NSAffineTransform *)mapFrom:(NSRect)srcBounds to:(NSRect)dstBounds;

/* scale the rectangle 'bounds' proportionally to the given height centered
 above the origin with the bottom of the rectangle a distance of height above
 the a particular point.  Handy for revolving items around a particular point. */
- (NSAffineTransform *)scaleBounds:(NSRect)bounds
                          toHeight:(float)height centeredDistance:(float)distance abovePoint:(NSPoint)location;

/* same as the above, except it centers the item above the origin.  */
- (NSAffineTransform *)scaleBounds:(NSRect)bounds
                          toHeight:(float)height centeredAboveOrigin:(float)distance;

/* initialize the NSAffineTransform so it will flip the contents of bounds
 vertically. */
- (NSAffineTransform *)flipVertical:(NSRect)bounds;

@end

@interface BezierLayoutManager : NSLayoutManager
{
    NSBezierPath *theBezierPath;
}

@end

@interface NSString (Glyphs)

- (NSBezierPath *)bezierWithFont: (NSFont*) theFont;

@end

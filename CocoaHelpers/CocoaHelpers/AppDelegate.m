//
//  AppDelegate.m
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
}

- (void)awakeFromNib
{
    self.button.delegate = self;
    [self.button setFontAttributesWithFont:[NSFont fontWithName:@"HelveticaNeue" size:13] color:[NSColor colorWithCalibratedWhite:0.3 alpha:1]];
}

- (void)simpleButtonClicked:(NSEvent *)event from:(id)sender
{

}

@end

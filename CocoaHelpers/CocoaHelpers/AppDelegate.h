//
//  AppDelegate.h
//  CocoaHelpers
//
//  Created by Lee Brimelow on 3/20/14.
//  Copyright (c) 2014 Lee Brimelow. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SimpleButton.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, SimpleButtonDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet SimpleButton *button;

@end

//
//  MacRarAppDelegate.m
//  MacRar
//
//  Created by Vincenzo Pimpinella on 25/08/11.
//  Copyright 2011 Sapienza. All rights reserved.
//

#import "MacRarAppDelegate.h"
#import "Controller.h"

@implementation MacRarAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [t setEditable:FALSE];
    [t2 setEditable:FALSE];
    
    [salva setEnabled:FALSE];
    [esegui setEnabled:FALSE];

}

@end

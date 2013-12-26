//
//  MacRarAppDelegate.h
//  MacRar
//
//  Created by Vincenzo Pimpinella on 25/08/11.
//  Copyright 2011 Sapienza. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MacRarAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    IBOutlet NSTextField* t;
    IBOutlet NSTextField* t2;

    IBOutlet NSButton* salva;
    IBOutlet NSButton* esegui;
}

@property (assign) IBOutlet NSWindow *window;

@end

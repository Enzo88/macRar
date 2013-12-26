//
//  Controller.h
//  MacRar
//
//  Created by Vincenzo Pimpinella on 25/08/11.
//  Copyright 2011 Sapienza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Controller : NSObject {
    IBOutlet NSButton* button;
    IBOutlet NSButton* save_button;
    IBOutlet NSButton* exec_button;
    IBOutlet NSTextField* archivio;
    IBOutlet NSTextField* selected;
    NSMutableArray* filename;
    NSString* dest;
}

- (IBAction)Open:(id)sender;
- (IBAction)Esegui:(id)sender;
- (IBAction)saveButton:(id)sender;

@end

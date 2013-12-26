//
//  Controller.m
//  MacRar
//
//  Created by Vincenzo Pimpinella on 25/08/11.
//  Copyright 2011 Sapienza. All rights reserved.
//

#import "Controller.h"
#import <unistd.h>
#include <string.h>
#include <stdio.h>


@implementation Controller

- (id)init
{
    self = [super init];
    if (self) {
        filename = [[NSMutableArray alloc] init];
    }
    [selected setEditable:FALSE];
    return self;
}

- (IBAction)saveButton:(id)sender {
    NSSavePanel *spanel = [NSSavePanel savePanel];
    NSString *path = @"/Documents";
    [spanel setDirectory:[path stringByExpandingTildeInPath]];
    [spanel setPrompt:NSLocalizedString(@"OK",nil)];
    [spanel setRequiredFileType:@"rar"];
    if ( [spanel runModalForDirectory:nil file:nil] == NSOKButton ){
        dest = [spanel filename];
        [archivio setStringValue:dest];
        [exec_button setEnabled:TRUE];
    }
    
}

- (IBAction)Open:(id)sender {
    
    // Create the File Open Dialog class.
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    // Enable the selection of files in the dialog.
    [openDlg setCanChooseFiles:YES];
    
    // Enable the selection of directories in the dialog.
    [openDlg setCanChooseDirectories:YES];
    
    // Display the dialog.  If the OK button was pressed,
    // process the files.
    if ( [openDlg runModalForDirectory:nil file:nil] == NSOKButton )
    {
        // Get an array containing the full filenames of all
        // files and directories selected.
        //NSArray* files = [openDlg filenames];
        NSString* file = [openDlg filename];
        
        [filename addObject:file];
        [selected setStringValue:[[selected stringValue] stringByAppendingString: file]];
        [save_button setEnabled:TRUE];
    }
    
}

- (IBAction)Esegui:(id)sender {
    NSString* app_path = [[NSBundle mainBundle] bundlePath]; //Application Path
    app_path = [@"'" stringByAppendingString: app_path];
    NSString* st = @"/rar' a '";
    st = [app_path stringByAppendingString: st];
    st = [st stringByAppendingString: dest];
    st = [st stringByAppendingString: @"'"];

    int i = 0;
    for (i = 0; i < [filename count]; i++) {
        st = [st stringByAppendingString: @" "];
        st = [st stringByAppendingString: @"'"];
        st = [st stringByAppendingString: [filename objectAtIndex:i]];
        st = [st stringByAppendingString: @"'"];
    }
    
    NSLog(@"%@",st);
    system([st UTF8String]);

    
    int flag = open([dest UTF8String], O_RDONLY);
    if (flag > -1) {
        NSAlert* message = [[NSAlert alloc]init]; 
        [message addButtonWithTitle:@"OK"];
        [message setMessageText:@"File compresso corretamente"];
        [message setAlertStyle:NSInformationalAlertStyle];
        [message runModal];
        [message autorelease];
        close(flag);
    } else {
        NSAlert* message = [[NSAlert alloc]init]; 
        [message addButtonWithTitle:@"OK"];
        [message setMessageText:@"Errore nella compressione"];
        [message setInformativeText:@"Errore nella compressione del file selezionato, riprovare con una nuova destinazione."];
        [message setAlertStyle:NSCriticalAlertStyle];
        [message runModal];
        [message autorelease];

    }
    
    [selected setStringValue:@""];
    [archivio setStringValue:@""];
    [filename release];
    dest = @"";
    [save_button setEnabled:FALSE];
    [exec_button setEnabled:FALSE];
    filename = [[NSMutableArray alloc] init]; 
}


@end

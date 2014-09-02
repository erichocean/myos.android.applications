/*
 * Copyright 2014 myOS Group. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit-private.h>
#import <IOKit/IOKit.h>
#import "FileManager.h"

#pragma mark - Public C functions

void FileManagerSetupDirectories()
{
    //DLog(@"");
    NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *filePath = @"/data/data/com.myos.myapps/apps";
	//DLog(@"filePath: %@", filePath);
	if ([fileManager fileExistsAtPath:filePath]) {
    } else {
        IOPipeRunCommand([NSString stringWithFormat:@"mkdir %@", filePath], NO);
    }
}

NSMutableArray *FileManagerInstantiateApps()
{
    NSMutableArray *apps = [[NSMutableArray alloc] initWithCapacity:100];
    NSString *filePath = @"/data/data/com.myos.myapps/apps";
    
    NSArray *directories = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:NULL];
    UIMAApplication *maApp;
    for (NSString *directory in directories) {
        NSString *appName  = [directory stringByReplacingOccurrencesOfString:@".app" withString:@""];
        //DLog(@"appName: %@", appName);
        maApp = [[UIMAApplication alloc] initWithAppName:appName];
        [apps addObject:maApp];
        [maApp release];
    }
    return apps;
}

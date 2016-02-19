//
//  LibraryAppDelegate.h
//  Barion iOS Library
//
//  Created by László Takács on 23/09/15.
//  Copyright (c) 2015 Barion Payment Zrt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryAppDelegate : UIResponder <UIApplicationDelegate>
typedef enum {
    BarionServerDemo,
    BarionServerDev,
    BarionServerTest,
    BarionServerLive
} BarionServer;
@property (strong, nonatomic) UIWindow *window;

@property BarionServer server;

@end

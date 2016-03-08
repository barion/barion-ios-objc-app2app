//
//  BaseConnectionHandler.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseConnectionHandlerDelegate <NSObject, NSURLSessionDelegate>

-(void)networkError;

@end

@interface BaseConnectionHandler : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate>
{
    NSURLConnection *_connection;
    NSMutableData *_data;
    float _timeout;
}

-(void)cancel;
-(void)startGETWithUrlString:(NSString*)urlString;
-(void)startPOSTWithUrlString:(NSString*)urlString jsonString:(NSString*)jsonString;
-(void)requestComplete:(NSDictionary*)result;
-(void)error:(NSArray*)barionErrors;
@end

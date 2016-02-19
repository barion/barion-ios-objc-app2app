//
//  BarionError.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarionError : NSObject

@property (nonatomic, retain) NSString *errorCode;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *errorDescription;

-(id)initWithErrorCode:(NSString*)errorCode title:(NSString*)title description:(NSString*)errorDescription;

@end

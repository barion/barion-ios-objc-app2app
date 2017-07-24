//
//  BarionStartPaymentResponse.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarionStartPaymentResponse : NSObject
@property (nonatomic, retain) NSString *paymentId;
@property (nonatomic, retain) NSString *paymentRequestId;
@property (nonatomic, retain) NSArray *paymentTransactions;
@property (nonatomic, retain) NSString *status;

-(id)initWithJsonDictionary:(NSDictionary*)jsonDict;

@end

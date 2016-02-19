//
//  BarionGetPaymentStateResponse.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarionGetPaymentStateResponse : NSObject

@property (nonatomic, retain) NSString *paymentId;
@property (nonatomic, retain) NSString *paymentRequestId;
@property (nonatomic, retain) NSString *posId;
@property (nonatomic, retain) NSString *posName;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *paymentType;
@property (nonatomic, retain) NSString *fundingSource;
@property BOOL guestCheckout;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *validUntil;
@property (nonatomic, retain) NSDate *completedAt;
@property (nonatomic, retain) NSDate *reservedUntil;
@property (nonatomic, retain) NSArray *transactions;
@property float total;

-(id)initWithJsonDictionary:(NSDictionary*)jsonDict;

@end

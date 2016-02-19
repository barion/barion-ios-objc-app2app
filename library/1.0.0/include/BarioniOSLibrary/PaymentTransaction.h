//
//  PaymentTransaction.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaymentTransaction : NSObject

@property (nonatomic, retain) NSString *posTransactionId;
@property (nonatomic, retain) NSString *transactionId;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *relatedId;
@property (nonatomic, retain) NSDate* transactionTime;

-(id)initWithJsonDictionary:(NSDictionary*)jsonDict;

@end

/**
 * Copyright 2015 Barion Payment Inc. All Rights Reserved.
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p/>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p/>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>

@interface BarionGetPaymentStateResponse : NSObject

@property (nonatomic, retain) NSString* paymentId;
@property (nonatomic, retain) NSString* paymentRequestId;
@property (nonatomic, retain) NSString* posId;
@property (nonatomic, retain) NSString* posName;
@property (nonatomic, retain) NSString* status;
@property (nonatomic, retain) NSString* paymentType;
@property (nonatomic, retain) NSString* fundingSource;
@property BOOL guestCheckout;
@property (nonatomic, retain) NSDate* createdAt;
@property (nonatomic, retain) NSDate* validUntil;
@property (nonatomic, retain) NSDate* completedAt;
@property (nonatomic, retain) NSDate* reservedUntil;
@property (nonatomic, retain) NSArray* transactions;
@property float total;

- (id)initWithJsonDictionary:(NSDictionary*)jsonDict;

@end

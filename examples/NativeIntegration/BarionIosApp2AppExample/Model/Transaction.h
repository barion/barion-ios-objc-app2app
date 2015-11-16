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
#import "User.h"

@interface Transaction : NSObject

@property (nonatomic, retain) NSString* transactionId;
@property (nonatomic, retain) NSString* posTransactionId;
@property (nonatomic, retain) NSDate* transactionTime;
@property float total;
@property (nonatomic, retain) User* payer;
@property (nonatomic, retain) User* payee;
@property (nonatomic, retain) NSString* comment;
@property (nonatomic, retain) NSString* status;
@property (nonatomic, retain) NSString* transactionType;
@property (nonatomic, retain) NSArray* items;
@property (nonatomic, retain) NSString* relatedId;
@property (nonatomic, retain) NSString* posId;

- (id)initWithJsonDictionary:(NSDictionary*)jsonDict;

@end

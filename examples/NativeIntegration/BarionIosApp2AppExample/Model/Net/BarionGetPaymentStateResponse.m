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

#import "BarionGetPaymentStateResponse.h"
#import "Transaction.h"

@implementation BarionGetPaymentStateResponse

- (id)initWithJsonDictionary:(NSDictionary*)jsonDict
{
    self = [super init];
    if(self)
    {
        _paymentId = [jsonDict objectForKey: @"PaymentId"];
        _paymentRequestId = [jsonDict objectForKey: @"PaymentRequestId"];
        _posId = [jsonDict objectForKey: @"POSId"];
        _status = [jsonDict objectForKey: @"Status"];
        _paymentType = [jsonDict objectForKey: @"PaymentType"];
        _fundingSource = [jsonDict objectForKey: @"FundingSource"];
        _guestCheckout = [[jsonDict objectForKey: @"GuestCheckout"] boolValue];
        _createdAt = [jsonDict objectForKey: @"CreatedAt"];
        _validUntil = [jsonDict objectForKey: @"ValidUntil"];
        _completedAt = [jsonDict objectForKey: @"CompletedAt"];
        _reservedUntil = [jsonDict objectForKey: @"ReservedUntil"];
        NSArray* transactions = [jsonDict objectForKey: @"Transactions"];
        if(transactions.count > 0) {
            NSMutableArray* tempTransactions = [NSMutableArray new];
            for(int i = 0; i < transactions.count; ++i) {
                NSDictionary* transactionDict = [transactions objectAtIndex: i];
                Transaction* t = [[Transaction alloc] initWithJsonDictionary: transactionDict];
                [tempTransactions addObject: t];
            }
            _transactions = tempTransactions;
        }
        _total = [[jsonDict objectForKey: @"Total"] floatValue];
    }
    return self;
}

@end

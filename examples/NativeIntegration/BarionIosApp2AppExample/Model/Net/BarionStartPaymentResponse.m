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

#import "BarionStartPaymentResponse.h"
#import "PaymentTransaction.h"

@implementation BarionStartPaymentResponse

- (id)initWithJsonDictionary:(NSDictionary*)jsonDict
{
    self = [super init];
    if(self)
    {
        _paymentId = [jsonDict objectForKey: @"PaymentId"];
        _paymentRequestId = [jsonDict objectForKey: @"PaymentRequestId"];
        _status = [jsonDict objectForKey: @"Status"];

        NSMutableArray* tempPaymentTransactions = [NSMutableArray new];
        NSArray* transactionArray = [jsonDict objectForKey: @"Transactions"];
        if(transactionArray.count != 0) {
            for(int i = 0; i < transactionArray.count; ++i) {
                NSDictionary* transactionDictionary = [transactionArray objectAtIndex: i];
                PaymentTransaction* transaction = [[PaymentTransaction alloc] initWithJsonDictionary: transactionDictionary];
                [tempPaymentTransactions addObject: transaction];
            }
        }
        _paymentTransactions = tempPaymentTransactions;
    }
    return self;
}

@end

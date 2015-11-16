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

#import "Transaction.h"
#import "Product.h"

@implementation Transaction

- (id)initWithJsonDictionary:(NSDictionary*)jsonDict
{
    self = [super init];
    if(self)
    {
        _transactionId = [jsonDict objectForKey: @"TransactionId"];
        _posTransactionId = [jsonDict objectForKey: @"POSTransactionId"];
        _transactionTime = [jsonDict objectForKey: @"TransactionTime"];
        _total = [[jsonDict objectForKey: @"Total"] floatValue];
        NSDictionary* payerDict = [jsonDict objectForKey: @"Payer"];
        _payer = [[User alloc] initWithJsonDictionary: payerDict];
        NSDictionary* payeeDict = [jsonDict objectForKey: @"Payee"];
        _payee = [[User alloc] initWithJsonDictionary: payeeDict];
        _comment = [jsonDict objectForKey: @"Comment"];
        _status = [jsonDict objectForKey: @"Status"];
        _transactionType = [jsonDict objectForKey: @"TransactionType"];
        NSArray* items = [jsonDict objectForKey: @"Items"];
        if(![items isKindOfClass: [NSNull class]] && items.count > 0) {
            NSMutableArray* tempItems = [NSMutableArray new];
            for(int i = 0; i < items.count; ++i) {
                NSDictionary* itemDict = [items objectAtIndex: i];
                Product* product = [[Product alloc] initWithName: [itemDict objectForKey: @"Name"] description: [itemDict objectForKey: @"Description"] quantity: [[itemDict objectForKey: @"Quantity"] floatValue] unit: [itemDict objectForKey: @"Unit"] price: [[itemDict objectForKey: @"ItemTotal"] floatValue] SKU: [itemDict objectForKey: @"SKU"]];
                [tempItems addObject: product];
            }
            _items = tempItems;
        }
        _relatedId = [jsonDict objectForKey: @"RelatedId"];
        _posId = [jsonDict objectForKey: @"POSId"];
    }
    return self;
}

@end

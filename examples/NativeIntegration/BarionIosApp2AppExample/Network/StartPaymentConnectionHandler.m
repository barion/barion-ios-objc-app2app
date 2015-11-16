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

#import "StartPaymentConnectionHandler.h"
#import "Product.h"
#import "Parameters.h"

@implementation StartPaymentConnectionHandler

- (id)initWithDelegate:(id<StartPaymentConnectionHandlerDelegate>)delegate products:(NSArray*)products;
{
    self = [super init];
    if(self)
    {
        _delegate = delegate;
        
        NSMutableArray* productsArray = [NSMutableArray new];
        for(int i = 0; i < products.count; ++i)
        {
            Product* p = [products objectAtIndex: i];
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject: p.name forKey: @"Name"];
            [dict setObject: p.productDescription forKey: @"Description"];
            [dict setObject: [NSString stringWithFormat: @"%f", p.quantity] forKey: @"Quantity"];
            [dict setObject: p.unit forKey: @"Unit"];
            [dict setObject: [NSString stringWithFormat: @"%f", p.price] forKey: @"UnitPrice"];
            [dict setObject: [NSString stringWithFormat: @"%f", p.price] forKey: @"ItemTotal"];
            [dict setObject: p.SKU forKey: @"SKU"];
            [productsArray addObject: dict];
        }
        
        NSMutableDictionary* containerDict = [NSMutableDictionary new];
        [containerDict setObject: productsArray forKey: @"Products"];
        [containerDict setObject: [Parameters redirectUrl] forKey: @"RedirectUrl"];
        
        NSString* jsonString = [[NSString alloc] initWithData: [NSJSONSerialization dataWithJSONObject: containerDict options:0 error:nil] encoding: NSUTF8StringEncoding];
        
        
        [self startPOSTWithUrlString: [Parameters startBarionPaymentUrl] jsonString: jsonString];
    }
    return self;
}

- (void)requestComplete:(NSDictionary *)result
{
    [_delegate paymentStartSuccessed: result];
}

- (void)error:(NSArray *)barionErrors
{
    if(barionErrors == nil)
    {
        [_delegate networkError];
    } else
    {
        [_delegate paymentStartFailed: barionErrors];
    }
}

@end

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

#import "Product.h"

@implementation Product

- (id)initWithName:(NSString*)name description:(NSString*)prodDescription quantity:(float)quantity unit:(NSString*)unit price:(float)price SKU:(NSString*)SKU
{
    self = [super init];
    if(self)
    {
        _name = name;
        _productDescription = prodDescription;
        _quantity = quantity;
        _unit = unit;
        _price = price;
        _SKU = SKU;
    }
    return self;
}

+ (NSArray*)getProducts
{
    NSMutableArray* result = [NSMutableArray new];
    [result addObject: [[Product alloc] initWithName: @"The history of money" description: @"The evolution of money from the stoneage to Barion" quantity: 1 unit:@"db" price: 40 SKU: @"APP2APP_PENZTORT"]];
    [result addObject: [[Product alloc] initWithName: @"How to make a fortune with Barion" description: @"Tips to get rich" quantity: 1 unit:@"db" price: 20 SKU: @"APP2APP_GETRICH"]];
    [result addObject: [[Product alloc] initWithName: @"The beginners guide to accepting bank cards" description: @"How to become bank card acceptors in five minutes with Barion" quantity: 1 unit:@"db" price: 140 SKU: @"APP2APP_BEGGUIDE"]];
    return result;
}


@end

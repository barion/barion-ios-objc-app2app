//
//  Product.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject <NSCopying>

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *productDescription;
@property (nonatomic, retain) NSString *unit;
@property (nonatomic, retain) NSString *SKU;
@property float quantity;
@property float price;
@property float itemTotal;

-(id)initWithName:(NSString*)name description:(NSString*)prodDescrition quantity:(float)quantity unit:(NSString*)unit price:(float)price SKU:(NSString*)SKU;

-(instancetype)initUsingBlock:(void(^)(id mutableCopy))block;

@end

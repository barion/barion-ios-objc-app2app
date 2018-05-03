//
//  Barion.h
//  Barion iOS Library
//
//  Created by László Takács on 05/11/15.
//  Copyright © 2015 Barion Payment Zrt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Barion : NSObject

extern NSString * const MISSING_POSKEY;
extern NSString * const MISSING_PAYMENTTYPE;
extern NSString * const MISSING_RESERVATIONPERIOD;
extern NSString * const MISSING_FUNDINGSOURCES;
extern NSString * const MISSING_LOCALE;
extern NSString * const MISSING_POSTRANSACTIONID;
extern NSString * const MISSING_PAYEE;
extern NSString * const MISSING_REQUIRED_PARAMETERS;

extern NSString * const MISSING_PRODUCT_LIST;
extern NSString * const MISSING_PRODUCT_NAME;
extern NSString * const MISSING_PRODUCT_DESCRIPTION;
extern NSString * const MISSING_PRODUCT_QUANTITY;
extern NSString * const MISSING_PRODUCT_UNIT;
extern NSString * const MISSING_PRODUCT_UNITPRICE;
extern NSString * const MISSING_PRODUCT_ITEMTOTAL;

extern NSString * const NO_RESPONSE;
extern NSString * const CANCELED_PAYMENT;

@end

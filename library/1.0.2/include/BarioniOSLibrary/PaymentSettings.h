//
//  PaymentSettings.h
//  Barion iOS Library
//
//  Created by László Takács on 22/09/15.
//  Copyright (c) 2015 Barion Payment Zrt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaymentSettings : NSObject <NSCopying>

typedef NS_ENUM(NSInteger, PaymentType){
    Immediate,
    Reservation
};

typedef NS_ENUM(NSInteger, FundingSource){
    All,
    Balance,
    Bancard
};

@property (retain, nonatomic) NSString *posKey;
@property PaymentType paymentTypeEnum;
@property (retain, nonatomic) NSString *paymentType;
@property (assign, nonatomic) BOOL guestCheckOut;
@property FundingSource fundingSourceEnum;
@property (retain, nonatomic) NSString *fundingSource;
@property (retain, nonatomic) NSString *locale;
@property (retain, nonatomic) NSDate *reservationPeriod;
@property (retain, nonatomic) NSDate *paymentWindow;
@property (assign, nonatomic) BOOL initiateRecurrence;
@property (retain, nonatomic) NSString *recurrenceId;
@property (retain, nonatomic) NSString *paymentRequestId;
@property (retain, nonatomic) NSString *redirectUrl;
@property (retain, nonatomic) NSString *callbackUrl;
@property (retain, nonatomic) NSString *orderNumber;
@property (retain, nonatomic) NSString *shippingAddress;
@property (assign, nonatomic) BOOL debugMode;
@property (retain, nonatomic) NSString *redirectUrliOS9;


-(id)initWithPOSKey:(NSString*)posKey paymentType:(PaymentType)paymentType guestCheckOut:(BOOL)guestCheckOut fundingSource:(FundingSource)fundingSource locale:(NSString*)locale reservationPeriod:(NSDate*)reservationPeriod paymentWindow:(NSDate*)paymentWindow initiateRecurrence:(BOOL)initiateRecurrence recurrenceId:(NSString*)recurrenceId paymentRequestId:(NSString*)paymentRequestId redirectUrl:(NSString*)redirectUrl callbackUrl:(NSString*)callbackUrl orderNumber:(NSString*)orderNumber shippingAddress:(NSString*)shippingAddress debugMode:(BOOL)debugMode redirectUrliOS9:(NSString*)redirectUrliOS9;

-(instancetype)initUsingBlock:(void(^)(id mutableCopy))block;
-(NSString*)formatPaymentTypeToString:(PaymentType)type;
-(NSString*)formatFundingSourceToString:(FundingSource)type;
@end

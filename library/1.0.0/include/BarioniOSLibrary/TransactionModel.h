//
//  TransactionModel.h
//  Barion iOS Library
//
//  Created by László Takács on 23/09/15.
//  Copyright (c) 2015 Barion Payment Zrt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionModel : NSObject <NSCopying>

@property (retain, nonatomic) NSString *posTransactionId;
@property (retain, nonatomic) NSString *payee;
@property (retain, nonatomic) NSString *comment;
@property (assign, nonatomic) float total;

-(instancetype)initUsingBlock:(void(^)(id mutableCopy))block;

@end

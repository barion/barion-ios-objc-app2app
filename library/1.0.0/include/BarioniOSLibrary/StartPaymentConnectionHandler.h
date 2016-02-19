//
//  StartPaymentConnectionHandler.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import "BaseConnectionHandler.h"
#import "PaymentSettings.h"
#import "TransactionModel.h"

@protocol StartPaymentConnectionHandlerDelegate <BaseConnectionHandlerDelegate>

- (void)paymentStartSuccessed:(NSDictionary*)result;
- (void)paymentStartFailed:(NSArray*)errors;

@end


@interface StartPaymentConnectionHandler : BaseConnectionHandler
{
    id<StartPaymentConnectionHandlerDelegate> _delegate;
}

- (id)initWithDelegate:(id<StartPaymentConnectionHandlerDelegate>)delegate products:(NSArray*)products transactionSettings:(TransactionModel*)tSettings paymentSettings:(PaymentSettings*)pSettings;
@end

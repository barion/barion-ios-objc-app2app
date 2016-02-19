//
//  GetPaymentStateConnectionHandler.h
//  BarionApp2AppTestIntegration
//
//  Created by László Takács on 07/09/15.
//  Copyright (c) 2015 László Takács. All rights reserved.
//

#import "BaseConnectionHandler.h"

@protocol GetPaymentStateConnectionHandlerDelegate <BaseConnectionHandlerDelegate>

-(void)getPaymentStateSuccessed:(NSDictionary*)response;
-(void)getPaymentStateFailed:(NSArray*)barionErrors;

@end

typedef void(^delegateBlock)(NSDictionary *response);

@interface GetPaymentStateConnectionHandler : BaseConnectionHandler
{
    id<GetPaymentStateConnectionHandlerDelegate> _delegate;
}
-(instancetype)init;
-(void)startRequestWithPaymentId:(NSString*)paymentId withPOSKey:(NSString*)posKey withTestMode:(BOOL)mode completion:(delegateBlock)callback;
- (id)initWithDelegate:(id<GetPaymentStateConnectionHandlerDelegate>)delegate posKey:(NSString*)posKey paymentId:(NSString*)paymentId inTestMode:(BOOL)mode;

@end

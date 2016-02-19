//
//  LibraryViewController.h
//  Barion iOS Library
//
//  Created by László Takács on 22/09/15.
//  Copyright (c) 2015 Barion Payment Zrt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartPaymentConnectionHandler.h"
#import "PaymentSettings.h"
#import "TransactionModel.h"
#import "GetPaymentStateConnectionHandler.h"
#import "BarionGetPaymentStateResponse.h"
#import "BarionError.h"
#import "Barion.h"

@protocol BarionLibraryDelegate <NSObject>

@required
-(void)barionLibraryStatus:(BarionError*)response;

@end

typedef void(^getBarionPaymentStateBlock)(NSDictionary *response);

@interface LibraryViewController : UIViewController <StartPaymentConnectionHandlerDelegate,GetPaymentStateConnectionHandlerDelegate>{
    StartPaymentConnectionHandler *paymentHandler;
    GetPaymentStateConnectionHandler *paymentStateHandler;
    UIAlertView *progressAlert;
}

@property (assign, nonatomic) id<BarionLibraryDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIWebView *web;

@property (retain, nonatomic) TransactionModel *transactionSettings;
@property (retain, nonatomic) PaymentSettings *paymentSettings;
@property (retain, nonatomic) NSMutableArray *productList;

@property (assign, nonatomic) BOOL Authenticated;
@property (retain, nonatomic) NSURLRequest *FailedRequest;

@property (retain, nonatomic) NSString *BaseRequest;

@property (retain, nonatomic) NSURL *url;

+(void)getPaymentStateWithUrl:(NSURL*)url withPOSKey:(NSString*)posKey inDebugMode:(BOOL)mode andWithCallback:(getBarionPaymentStateBlock)callback;
-(void)getPaymentStateWithPOSKey:(NSString*)posKey andReturnedUrl:(NSURL*)url inTestMode:(BOOL)mode;


@end

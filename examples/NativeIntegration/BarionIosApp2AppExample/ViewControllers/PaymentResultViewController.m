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

#import "PaymentResultViewController.h"
#import "BarionError.h"
#import "BarionGetPaymentStateResponse.h"
#import "Parameters.h"

@implementation PaymentResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Barion Smart Books";

    NSString* paymentId = [[_url absoluteString] stringByReplacingOccurrencesOfString: [NSString stringWithFormat: @"%@?paymentId=", [Parameters redirectUrl]] withString:@""];
    _getPaymentStateHandler = [[GetPaymentStateConnectionHandler alloc] initWithDelegate: self paymentId: paymentId];
}

- (void)getPaymentStateSuccessed:(NSDictionary*)response
{
    _getPaymentStateHandler = nil;
    BarionGetPaymentStateResponse* paymentState = [[BarionGetPaymentStateResponse alloc] initWithJsonDictionary: response];
    NSString* status = paymentState.status;
    _statusLabel.text = [NSString stringWithFormat: @"State of the payment: %@", status];
    status = [status lowercaseString];
    if([status isEqualToString: @"prepared"]) {
        _statusDescriptionLabel.text = @"The payment has been registered in the Barion system.";
    } else if([status isEqualToString: @"started"]) {
        _statusDescriptionLabel.text = @"The payment started successfully.";
    } else if([status isEqualToString: @"reserved"]) {
        _statusDescriptionLabel.text = @"The amount of the payment has been reserved.";
    } else if([status isEqualToString: @"canceled"]) {
        _statusDescriptionLabel.text = @"The user canceled the payment.";
    } else if([status isEqualToString: @"succeeded"]) {
        _statusDescriptionLabel.text = @"Payment succeeded.";
    } else if([status isEqualToString: @"failed"]) {
        _statusDescriptionLabel.text = @"Payment failed.";
    } else {
        _statusDescriptionLabel.text = @"Unknown error";
    }
}

- (void)getPaymentStateFailed:(NSArray*)barionErrors
{
    _getPaymentStateHandler = nil;
    _statusLabel.text = @"The payment was unsuccessful";
    if(barionErrors.count == 0) {
        _statusDescriptionLabel.text = @"Unknown error";
    } else {
        BarionError* error = [barionErrors objectAtIndex: 0];
        _statusDescriptionLabel.text = error.errorDescription;
    }
}

- (void)networkError
{
    _getPaymentStateHandler = nil;
    _statusLabel.text = @"The payment was unsuccessful";
    _statusDescriptionLabel.text = @"Unknown error";
}


@end

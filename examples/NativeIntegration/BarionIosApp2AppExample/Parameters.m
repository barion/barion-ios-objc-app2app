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

#import "Parameters.h"
#import <UIKit/UIKit.h>

@implementation Parameters

+ (NSString*)startBarionPaymentUrl
{
    NSString* url = @"http://your-domain.com/generate_barion_payment.php";
    return [Parameters throwExceptionOrReturnString: url];
}

+ (NSString*)getBarionPaymentStateUrl
{
    NSString* url = @"http://your-domain.com/get_barion_payment_state.php?PaymentId=";
    return [Parameters throwExceptionOrReturnString: url];
}

+ (NSString*)redirectUrl
{
    NSString* url;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 9) {
        url = @"your-domain://";
    } else {
        url = @"https://your-domain.com/barion";
    }
    return [Parameters throwExceptionOrReturnString: url];
}

+ (NSString*)throwExceptionOrReturnString:(NSString*)stringResult
{
    if([stringResult rangeOfString: @"your-domain"].location != NSNotFound) @throw [[NSException alloc] initWithName: @"MissingParametersException" reason: @"You have to fill all the variables in the Parameters class to use this application!" userInfo: nil];
    return stringResult;
}

@end

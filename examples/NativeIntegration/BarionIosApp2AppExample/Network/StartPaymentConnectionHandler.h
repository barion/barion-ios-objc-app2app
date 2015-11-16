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

#import "BaseConnectionHandler.h"

@protocol StartPaymentConnectionHandlerDelegate <BaseConnectionHandlerDelegate>

- (void)paymentStartSuccessed:(NSDictionary*)result;
- (void)paymentStartFailed:(NSArray*)errors;

@end

@interface StartPaymentConnectionHandler : BaseConnectionHandler
{
    id<StartPaymentConnectionHandlerDelegate> _delegate;
}

- (id)initWithDelegate:(id<StartPaymentConnectionHandlerDelegate>)delegate products:(NSArray*)products;

@end

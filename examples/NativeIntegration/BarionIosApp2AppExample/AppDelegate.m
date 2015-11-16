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

#import "AppDelegate.h"
#import "PaymentResultViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [self openPaymentResultViewControllerWithUrl: url];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler {
    [self openPaymentResultViewControllerWithUrl: userActivity.webpageURL];
    return YES;
}

- (void)openPaymentResultViewControllerWithUrl:(NSURL*)url
{
    UIStoryboard* sb = [UIStoryboard storyboardWithName: @"Main" bundle:nil];
    PaymentResultViewController* result = [sb instantiateViewControllerWithIdentifier:@"paymentResultViewController"];
    result.url = url;
    result.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UINavigationController* controller = (UINavigationController*)self.window.rootViewController;
    [controller setViewControllers: [NSArray arrayWithObject: result]];
}

@end

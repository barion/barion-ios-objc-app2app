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

#import "WebViewController.h"
#import "PaymentResultViewController.h"
#import "Parameters.h"
#import "AppDelegate.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Barion Smart Books";
    
    [_webView setHidden: YES];
    [_loadIndicator setHidden: NO];
    [_loadIndicator startAnimating];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:
                                     [NSURL URLWithString:
                                      [NSString stringWithFormat: @"https://test.barion.com/Pay?Id=%@", _paymentId]]];
    
    [_webView loadRequest: request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_loadIndicator stopAnimating];
    [_loadIndicator setHidden: YES];
    [_webView setHidden: NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_loadIndicator stopAnimating];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"The requested page could not load" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil, nil];
    [alert show];
    UIStoryboard* sb = [UIStoryboard storyboardWithName: @"Main" bundle:nil];
    PaymentResultViewController* result = [sb instantiateViewControllerWithIdentifier:@"paymentResultViewController"];
    result.url = [NSURL URLWithString: [NSString stringWithFormat:@"%@?paymentId=%@", [Parameters redirectUrl], _paymentId]];
    [self.navigationController setViewControllers: [NSArray arrayWithObject: result]];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([[request.URL absoluteString] hasPrefix: [Parameters redirectUrl]]) {
        [((AppDelegate*)[UIApplication sharedApplication].delegate) openPaymentResultViewControllerWithUrl: request.URL];
        return NO;
    }
    return YES;
}

@end

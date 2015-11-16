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
#import "BaseConnectionHandler.h"
#import "BarionError.h"

@implementation BaseConnectionHandler

static int _activityIndicatorRequest = 0;

- (id)init
{
    self = [super init];
    if(self)
    {
        _timeout = 30.0;
        _data = [[NSMutableData alloc] init];
        _activityIndicatorRequest++;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }
    return self;
}

- (void)dealloc
{
    [self cancel];
    if(_activityIndicatorRequest > 1) {
        _activityIndicatorRequest--;
    } else {
        _activityIndicatorRequest = 0;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}

- (void)cancel
{
    if(_connection)
    {
        [_connection cancel];
        _connection = nil;
    }
}

- (void)startGETWithUrlString:(NSString*)urlString
{
    NSURL* url = [NSURL URLWithString: urlString];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: url];
    [request setTimeoutInterval:_timeout];
    _connection = [[NSURLConnection alloc] initWithRequest: request delegate:self];
}

- (void)startPOSTWithUrlString:(NSString*)urlString jsonString:(NSString*)jsonString
{
    NSURL* url = [[NSURL alloc] initWithString: urlString];
    NSMutableURLRequest* urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    NSData* requestData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    [urlRequest setValue: [NSString stringWithFormat:@"%lu", (unsigned long)requestData.length] forHTTPHeaderField:@"Content-Length"];
    [urlRequest setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod: @"POST"];
    [urlRequest setHTTPBody: requestData];
    [urlRequest setTimeoutInterval:_timeout];
    _connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError* jsonParsingError;
    NSDictionary* jsonResult = [NSJSONSerialization JSONObjectWithData: _data options: 0 error: &jsonParsingError];
    if(jsonParsingError != nil) {
        [self error: nil];
    } else {
        NSArray* jsonErrors = [jsonResult objectForKey: @"Errors"];
        if(jsonErrors.count != 0)
        {
            NSMutableArray* errors = [NSMutableArray new];
            for(int i = 0; i < jsonErrors.count; ++i)
            {
                NSDictionary* errorDict = [jsonErrors objectAtIndex: i];
                BarionError* error = [[BarionError alloc] initWithErrorCode: [errorDict objectForKey: @"ErrorCode"] title: [errorDict objectForKey: @"Title"] description: [errorDict objectForKey: @"Description"]];
                [errors addObject: error];
            }
            [self error: errors];
        } else {
            [self requestComplete: jsonResult];
        }
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self cancel];
    [self error: nil];
}

- (void)requestComplete:(NSDictionary*)result
{
}

- (void)error:(NSArray*)barionErrors
{
}

- (void)setTimeout:(float)timeout{
    _timeout = timeout;
}


@end

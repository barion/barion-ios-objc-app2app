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

#import "MainViewController.h"
#import "Product.h"
#import "BarionStartPaymentResponse.h"
#import "Parameters.h"
#import "WebViewController.h"
#import "ProductTableViewCell.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Barion Smart Books";    
    
    _products = [Product getProducts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"ProductCell";
    
    ProductTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    Product* p = [_products objectAtIndex: indexPath.row];
    
    cell.nameLabel.text = p.name;
    cell.descriptionLabel.text = p.productDescription;
    cell.quantityLabel.text = [NSString stringWithFormat:@"%.0f %@", p.quantity, p.unit];
    cell.priceLabel.text = [NSString stringWithFormat: @"%.0f Ft", p.price];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _products.count;
}

- (IBAction)payWithBarion:(id)sender
{
    _progressAlert = [[UIAlertView alloc] initWithTitle: @"Communicating with the Barion system" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [_progressAlert show];
    startPaymentHandler = [[StartPaymentConnectionHandler alloc] initWithDelegate:self products: _products];
}

- (void)paymentStartSuccessed:(NSDictionary*)result
{
    startPaymentHandler = nil;
    [_progressAlert dismissWithClickedButtonIndex:0 animated: YES];
    BarionStartPaymentResponse* response = [[BarionStartPaymentResponse alloc] initWithJsonDictionary: result];
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat: @"barion://?pid=%@&redirectUrl=%@", response.paymentId, [Parameters redirectUrl]]];
    if([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIStoryboard* sb = [UIStoryboard storyboardWithName: @"Main" bundle:nil];
        WebViewController* web = [sb instantiateViewControllerWithIdentifier:@"webViewController"];
        web.paymentId = response.paymentId;
        web.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self.navigationController setViewControllers: [NSArray arrayWithObject: web]];
    }
}

- (void)paymentStartFailed:(NSArray*)errors
{
    startPaymentHandler = nil;
    [_progressAlert dismissWithClickedButtonIndex:0 animated: YES];
}

- (void)networkError
{
    [_progressAlert dismissWithClickedButtonIndex:0 animated: YES];
}


@end

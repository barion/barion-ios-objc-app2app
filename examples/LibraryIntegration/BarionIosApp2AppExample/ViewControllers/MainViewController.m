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
#import "Parameters.h"
#import "ProductTableViewCell.h"
#import "AppDelegate.h"
#import "../include/BarioniOSLibrary/PaymentSettings.h"
#import "../include/BarioniOSLibrary/TransactionModel.h"
#import "../include/BarioniOSLibrary/Product.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    self.title = @"Barion Smart Books";    
    
    _products = [self getProducts];
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
    TransactionModel *transactionSettings = [[TransactionModel alloc] initUsingBlock:^(TransactionModel *settings){
        settings.posTransactionId = @"TEST-01-App2App";
        settings.payee = [Parameters examplePayee];
        settings.total = [self getProductsTotal];
        settings.comment = @"Barion app2app ios library";
    }];
    
    PaymentSettings *paymentSettings = [[PaymentSettings alloc] initUsingBlock:^(PaymentSettings *settings){
        settings.posKey = [Parameters posKey];
        settings.paymentTypeEnum = Immediate;
        settings.guestCheckOut = YES;
        settings.debugMode = [Parameters debugMode];
        settings.locale = @"hu-HU";
#warning Currently the Barion mobile application supports only HUF currency!
        settings.currency = @"HUF";
        settings.fundingSourceEnum = All;
        settings.redirectUrl = [Parameters redirectUrl];
        settings.redirectUrliOS9 = [Parameters redirectUrl];
    }];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LibraryMain" bundle:[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"BarionBundle" withExtension:@"bundle"]]];
     appDelegate.libraryViewController = (LibraryViewController*)[sb instantiateInitialViewController];
     appDelegate.libraryViewController.delegate = self;
     appDelegate.libraryViewController.productList = [_products mutableCopy];
     appDelegate.libraryViewController.transactionSettings = transactionSettings;
     appDelegate.libraryViewController.paymentSettings = paymentSettings;
    [self presentViewController: appDelegate.libraryViewController animated:YES completion:nil];
}

-(void)barionLibraryStatus:(NSMutableDictionary *)response
{
    NSLog(@"response: %@", response);
}

/*
 You can catch the response of the v2/Payment/Start endpoint.
 */
-(void)startPaymentResponse:(id)startPaymentResponse{
    appDelegate.libraryViewController.paymentId = ((BarionStartPaymentResponse*)startPaymentResponse).paymentId;
}

- (NSArray*)getProducts
{
    NSMutableArray* result = [NSMutableArray new];
    [result addObject: [[Product alloc] initUsingBlock:^(Product *product) {
        product.name = @"The history of money";
        product.productDescription = @"The evolution of money from the stoneage to Barion";
        product.quantity = 1;
        product.unit = @"db";
        product.price = 40;
        product.itemTotal = 40;
        product.SKU = @"APP2APP_PENZTORT";
    }]];
    [result addObject: [[Product alloc] initUsingBlock:^(Product *product) {
        product.name = @"How to make a fortune with Barion";
        product.productDescription = @"Tips to get rich";
        product.quantity = 1;
        product.unit = @"db";
        product.price = 20;
        product.itemTotal = 20;
        product.SKU = @"APP2APP_GETRICH";
    }]];
    [result addObject: [[Product alloc] initUsingBlock:^(Product *product) {
        product.name = @"The beginners guide to accepting bank cards";
        product.productDescription = @"How to become bank card acceptors in five minutes with Barion";
        product.quantity = 1;
        product.unit = @"db";
        product.price = 140;
        product.itemTotal = 140;
        product.SKU = @"APP2APP_BEGGUIDE";
    }]];
    return result;
}

- (NSInteger)getProductsTotal
{
    NSInteger result = 0;
    for(Product* p in _products) {
        result += (int)p.price;
    }
    return result;
}


@end

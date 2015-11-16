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

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect r = self.frame;
    _nameLabel.frame = CGRectMake(8, 8, r.size.width - 100, 21);
    _descriptionLabel.frame = CGRectMake(8, 26, r.size.width - 100, 21);
    _quantityLabel.frame = CGRectMake(r.size.width - 84, 8, 76, 21);
    _priceLabel.frame = CGRectMake(r.size.width - 84, 26, 76, 21);
}

@end

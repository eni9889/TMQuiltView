//
//  TMQuiltView
//
//  Created by Bruno Virlet on 7/20/12.
//
//  Copyright (c) 2012 1000memories

//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
//  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
//  DEALINGS IN THE SOFTWARE.
//


#import "TMPhotoQuiltViewCell.h"
#define MARGIN 4.0

const CGFloat kTMPhotoQuiltViewMargin = 5;

@implementation TMPhotoQuiltViewCell

@synthesize photoView = _photoView;
@synthesize titleLabel = _titleLabel;

- (void)dealloc {
    [_photoView release], _photoView = nil;
    [_titleLabel release], _titleLabel = nil;
    
    [super dealloc];
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
        _photoView.contentMode = UIViewContentModeScaleAspectFill;
        _photoView.clipsToBounds = YES;
        [self addSubview:_photoView];
    }
    return _photoView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        _titleLabel.textAlignment = UITextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (void)layoutSubviews {
    self.photoView.frame = CGRectInset(self.bounds, kTMPhotoQuiltViewMargin, kTMPhotoQuiltViewMargin);
    self.titleLabel.frame = CGRectMake(kTMPhotoQuiltViewMargin, self.bounds.size.height - 40 - kTMPhotoQuiltViewMargin,
                                       self.bounds.size.width - 2 * kTMPhotoQuiltViewMargin, 40);
}

/*
- (void)layoutSubviews {
    
    CGFloat width = self.frame.size.width;
    CGFloat top = MARGIN;
    CGFloat left = MARGIN;
    
    // Image
    CGFloat objectWidth = 160;
    CGFloat objectHeight = 140;
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    if (!isnan(scaledHeight))
    {
        self.photoView.frame = CGRectMake(0, 0, width, scaledHeight);
    }
    else{
        self.photoView.frame = CGRectMake(0, 0, width, objectHeight);
    }
    
    // Label
    CGSize labelSize = CGSizeZero;
    labelSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(width - (2 * MARGIN), INT_MAX) lineBreakMode:self.titleLabel.lineBreakMode];
    
    top =  scaledHeight + MARGIN;
    
    self.titleLabel.frame = CGRectMake(0, self.photoView.frame.size.height, labelSize.width, labelSize.height+(MARGIN*2));
    
}
*/

@end

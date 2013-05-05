//
//  TMQuiltViewController.m
//  TMQuiltView
//
//  Created by Bruno Virlet on 7/20/12.
//
//  Copyright (c) 2012 1000memories

//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
//  EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
//  THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "TMQuiltViewController.h"

#import "TMQuiltView.h"
#import "TMQuiltViewCell.h"

@interface TMQuiltViewController () <TMQuiltViewDataSource, TMQuiltViewDelegate>

@end

@implementation TMQuiltViewController

@synthesize quiltView = _quiltView;
@synthesize headerView = _headerView;

- (void)dealloc {
    [_quiltView release], _quiltView = nil;
    
    [super dealloc];
}

- (void)loadView
{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    screenBounds.size.height = screenBounds.size.height - statusBarFrame.size.height;
    
    self.view = [[UIView alloc] initWithFrame: screenBounds];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    CGRect frame = self.view.frame;
    
    _quiltView = [[TMQuiltView alloc] initWithFrame:CGRectMake(0, SEGMENTED_CONTROL_HEIGHT, frame.size.width, frame.size.height - SEGMENTED_CONTROL_HEIGHT)];
    _quiltView.delegate = self;
    _quiltView.dataSource = self;
    _quiltView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, SEGMENTED_CONTROL_HEIGHT)];
    _headerView.backgroundColor = [UIColor blueColor];
    _headerView.autoresizingMask =  UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_quiltView];
    [self.view addSubview:_headerView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.quiltView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.quiltView = nil;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self.quiltView reloadData];
}

#pragma mark - TMQuiltViewDataSource

- (NSInteger)quiltViewNumberOfCells:(TMQuiltView *)quiltView {
    return 0;
}

- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath {
    TMQuiltViewCell *cell = [self.quiltView dequeueReusableCellWithReuseIdentifier:nil];
    if (!cell) {
        cell = [[[TMQuiltViewCell alloc] initWithReuseIdentifier:nil] autorelease];
    }
    return cell;
}

@end

//
//  IKViewController.m
//  VirtualScroll
//
//  Created by ilteris on 10/21/13.
//  Copyright (c) 2013 ilteris. All rights reserved.
//

#import "IKVirtualScrollViewController.h"
#import "IKViewController.h"

@interface IKVirtualScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation IKVirtualScrollViewController


IKViewController *_currentPage;
IKViewController *_nextPage;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _currentPage= [[IKViewController alloc] init];
    _nextPage = [[IKViewController alloc] init];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

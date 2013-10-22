//
//  IKViewController.m
//  VirtualScroll
//
//  Created by ilteris on 10/21/13.
//  Copyright (c) 2013 ilteris. All rights reserved.
//

#import "IKViewController.h"

@interface IKViewController ()

@end

@implementation IKViewController

- (id)init
{
    NSString *nibFileToLoad = @"IKViewController";
    
    self = [super initWithNibName:nibFileToLoad bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setPageIndex:(NSInteger)newPageIndex
{
    NSLog(@"newPageIndex is %i", newPageIndex);
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ATP_C1S%i.png", newPageIndex]];
}


-(void)viewWillAppear:(BOOL)animated
{

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

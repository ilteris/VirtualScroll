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
BOOL _transitioning;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    _transitioning = NO;

    
    _currentPage= [[IKViewController alloc] init];
    _nextPage =     [[IKViewController alloc] init];
    
    
    [_scrollView addSubview:_currentPage.view];
	[_scrollView addSubview:_nextPage.view];
    
    NSInteger widthCount = 4;
	if (widthCount == 0)
	{
		widthCount = 1;
	}
	
	self.scrollView.contentSize =CGSizeMake(self.scrollView.frame.size.width * widthCount,	 self.scrollView.frame.size.height);
	self.scrollView.contentOffset = CGPointMake(0, 0);
	
	
	self.scrollView.pagingEnabled = YES;

	
	
	
	[self applyNewIndex:0 pageController:_currentPage];
	[self applyNewIndex:1 pageController:_nextPage];

    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)scrollViewDidScroll:(UIScrollView *)sender
{
	_transitioning = YES;
	
	
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
	
	NSInteger lowerNumber = floor(fractionalPage);
	NSInteger upperNumber = lowerNumber + 1;
	
    
    
	if (lowerNumber == _currentPage.pageIndex)
	{
		if (upperNumber != _nextPage.pageIndex)
		{
			[self applyNewIndex:upperNumber pageController:_nextPage];
			
		}
	}
	else if (upperNumber == _currentPage.pageIndex)
	{
		if (lowerNumber != _nextPage.pageIndex)
		{
			[self applyNewIndex:lowerNumber pageController:_nextPage];
			
		}
	}
	else
	{
		if (lowerNumber == _nextPage.pageIndex)
		{
			[self applyNewIndex:upperNumber pageController:_currentPage];
			
			
			
		}
		else if (upperNumber == _nextPage.pageIndex)
		{
			[self applyNewIndex:lowerNumber pageController:_currentPage];
			
		}
		else
		{
			[self applyNewIndex:lowerNumber pageController:_currentPage];
			
			[self applyNewIndex:upperNumber pageController:_nextPage];
		}
	}
	//[self.currentPage updateTextViews:NO];
	//[self.nextPage updateTextViews:NO];
}




- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)newScrollView
{
	
	_transitioning = NO;
//	NSLog(@"scrollViewDidEndScrollingAnimation");
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
	NSInteger nearestNumber = lround(fractionalPage);
	
	
	if (_currentPage.pageIndex != nearestNumber)
	{
		IKViewController *swapController = _currentPage;
		_currentPage = _nextPage;
		_nextPage = swapController;
	}
	
    NSLog(@"scrollViewDidEndScrollingAnimation currentPage.pageIndex is %i", _currentPage.pageIndex);

	//[currentPage updateTextViews:YES];
}



//-scrollViewDidEndScrollingAnimation: is called when a programmatic-generated scroll finishes.
//-scrollViewDidEndDecelerating: is called when a user-swipe scroll finishes.

- (void)scrollViewDidEndDecelerating:(UIScrollView *)newScrollView
{
	[self scrollViewDidEndScrollingAnimation:newScrollView];
	//pageControl.currentPage = currentPage.pageIndex;
}


- (void)applyNewIndex:(NSInteger)newIndex pageController:(IKViewController *)ikViewController
{
	
	
	
	NSInteger pageCount = 4;//[_currentPage numDoses];
	BOOL outOfBounds = newIndex >= pageCount || newIndex < 0;
   

	if (!outOfBounds)
	{
		CGRect pageFrame = ikViewController.view.frame;
		pageFrame.origin.y = 0;
		pageFrame.origin.x = self.scrollView.frame.size.width * newIndex;
		ikViewController.view.frame = pageFrame;
	}
	else
	{
		CGRect pageFrame = ikViewController.view.frame;
		pageFrame.origin.y = self.scrollView.frame.size.height;
		ikViewController.view.frame = pageFrame;
	}
	
	ikViewController.pageIndex = newIndex;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

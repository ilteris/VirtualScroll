//
//  IKViewController.h
//  VirtualScroll
//
//  Created by ilteris on 10/21/13.
//  Copyright (c) 2013 ilteris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger chapterIndex;



@end

//
//  HomeViewController.m
//  REMenuExample
//
//  Created by Roman Efimov on 4/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "HomeViewController.h"
#import "Define.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

//- (id)init {
//    self = [super initWithNibName:nil bundle:nil];
//    return self;
//}

- (void)viewDidLoad
{
    NSLog(@"haman____HomeView___ciewDidLoad");
    self.title = @"Home";
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(CancelButtonTap)];

}

- (void)CancelButtonTap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

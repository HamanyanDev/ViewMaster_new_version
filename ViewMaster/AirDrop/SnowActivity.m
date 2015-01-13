//
//  SnowActivity.m
//  sendDataDemo
//
//  Created by Tachibana Kaoru on 12/09/29.
//  Copyright (c) 2012年 Toyship.org. All rights reserved.
//

#import "SnowActivity.h"

@implementation SnowActivity
- (NSString *)activityType {
    return @"Snow";
}

- (NSString *)activityTitle {
    return @"Star";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"icon_image_Subscription"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems{
	return YES;
	
}

- (void)prepareWithActivityItems:(NSArray *)activityItems;{
	NSLog(@"prepare!!");
	
	[super prepareWithActivityItems:activityItems];
    
    self.createfolder = [[CreateFolderViewController alloc] init];
    self.createfolder.check_from_airdrop = true;
    
//    _createfolder.delegate = self;
	
//	if( self.snowViewController == nil){
//		self.snowViewController = [[SnowViewController alloc] init];
//		self.snowViewController.delegate = self;
//	}
	
}

- (UIViewController *)activityViewController{
//    return self.snowViewController;
    NSLog(@"activityViewController_return self.createfolder");
	return self.createfolder;
}

- (void)performActivity{
// this is not called.
}

- (void)activityDidFinish:(BOOL)completed{
	NSLog(@"finished!!");
	
	[super activityDidFinish:completed];
}
@end

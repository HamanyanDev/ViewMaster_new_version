//
//  CreateFolderViewController.h
//  ViewMaster
//
//  Created by tvt on 2014/09/22.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreateFolderViewController : UIViewController <UITextFieldDelegate>{
    BOOL check_from_airdrop;
}


-(NSString*) ReturnText;
@property BOOL check_from_airdrop;

@end

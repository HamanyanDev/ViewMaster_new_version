//
//  SectionTableViewController.h
//  ViewMaster
//
//  Created by HiroyukiHamana on 2014/10/27.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *sectionList;
    NSDictionary *dataSource;
}


@end

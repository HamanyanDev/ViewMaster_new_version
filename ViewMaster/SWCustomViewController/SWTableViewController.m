//
//  SWTableViewController.m
//  SWTableViewCellDemo
//
//  Created by JL on 14-3-19.
//  Copyright (c) 2014年 ninetowns. All rights reserved.
//

#import "SWTableViewController.h"
#import "CustomAirDropActivity.h"
#import "SnowActivity.h"
#import "Define.h"

@interface SWTableViewController ()

@end

@implementation SWTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //注册了Cell以后在dequeueReusableCellWithIdentifier:方法中会自动创建Cell就不需要再写if(!cell){}了
//    [self.tableView registerNib:[UINib nibWithNibName:@"SWCustomCell" bundle:nil] forCellReuseIdentifier:@"cellIdentifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    SWCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SWCustomCell" owner:nil options:nil] lastObject];
        __weak SWCustomCell *weakCell = cell;
        //Do any fixed setup here (will be executed once unless force is set to YES)
        [cell setAppearanceWithBlock:^{
            weakCell.containingTableView = tableView;
            
            NSMutableArray *leftUtilityButtons = [NSMutableArray new];
            NSMutableArray *rightUtilityButtons = [NSMutableArray new];
            
            [leftUtilityButtons sw_addUtilityButtonWithColor:
             [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                        icon:[UIImage imageNamed:@"check.png"]];
            [leftUtilityButtons sw_addUtilityButtonWithColor:
             [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                        icon:[UIImage imageNamed:@"clock.png"]];
            [leftUtilityButtons sw_addUtilityButtonWithColor:
             [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                        icon:[UIImage imageNamed:@"cross.png"]];
            [leftUtilityButtons sw_addUtilityButtonWithColor:
             [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                        icon:[UIImage imageNamed:@"list.png"]];
            
            [rightUtilityButtons sw_addUtilityButtonWithColor:
             [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                        title:@"More"];
            [rightUtilityButtons sw_addUtilityButtonWithColor:
             [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                        title:@"Delete"];
            
            weakCell.leftUtilityButtons = leftUtilityButtons;
            weakCell.rightUtilityButtons = rightUtilityButtons;
            
            weakCell.delegate = self;
        } force:NO];
        
        NSLog(@"hama___cell_text");
//        if (indexPath.section == 0) {
//            switch (indexPath.row) {
//                case 0:
//                    cell.myLabel.text = @"STAR";
//                    cell.imageView.image = [UIImage imageNamed:ICON_STAR];  //アイコンを設定 = ICON_STAR;
//                    break;
//                    
//                case 1:
//                    cell.myLabel.text = @"HEART";
//                    cell.imageView.image = [UIImage imageNamed:ICON_HEART];  //アイコンを設定pstrIconName = ICON_HEART;
//                    break;
//                    
//                case 2:
//                    cell.myLabel.text = @"CLOUD";
//                    cell.imageView.image = [UIImage imageNamed:ICON_CLOUD];  //アイコンを設定pstrIconName =ICON_CLOUD;
//                    break;
//                    
//                case 3:
//                    cell.myLabel.text = @"Settings";
//                    cell.imageView.image = [UIImage imageNamed:ICON_SETTING];  //アイコンを設定pstrIconName = ICON_SETTING;
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
        cell.myLabel.text = @"Some Text";
        [cell setCellHeight:44];

        }
    // Configure the cell...
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 */

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"check button was pressed");
            break;
        case 1:
            NSLog(@"clock button was pressed");
            break;
        case 2:
            NSLog(@"cross button was pressed");
            break;
        case 3:
            NSLog(@"list button was pressed");
            
            NSLog(@"act7");

            NSString *text = @"Hello World!";
            UIImage* image1 = [UIImage imageNamed:@"book.jpg"];
            UIImage* image2 = [UIImage imageNamed:@"tree.png"];
            NSArray* actItems = [NSArray arrayWithObjects:text, image1, image2 , nil];
            
            // original activity
            CustomAirDropActivity* airdrop_1 = [[CustomAirDropActivity alloc] init];
            SnowActivity* airdrop_2 = [[SnowActivity alloc] init];
            NSArray* myItems = [NSArray arrayWithObjects:airdrop_1, airdrop_2, nil];

            UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:myItems];
                
            [self presentViewController:activityView animated:YES completion:^{
                }];
                
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"More button was pressed");
            [self AirdropButtonTap];
            break;
        case 1:
        {
            break;
        }
        default:
            break;
    }
}

- (void)AirdropButtonTap{
    NSString *text = @"Hello World!";
    UIImage* image1 = [UIImage imageNamed:@"book.jpg"];
    UIImage* image2 = [UIImage imageNamed:@"tree.png"];
    NSArray* actItems = [NSArray arrayWithObjects:text, image1, image2 , nil];
    
    
    
    CustomAirDropActivity* airdrop_1 = [[CustomAirDropActivity alloc] init];
    //    SnowActivity* a2 = [[[SnowActivity alloc] init] autorelease];
    NSArray* myItems = [NSArray arrayWithObjects:airdrop_1, nil];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:myItems];
    
    [self presentViewController:activityView animated:YES completion:^{
    }];
    
    
    
}



@end

//
//  FirstViewController.m
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "FirstViewController.h"
#import "ZeroViewController.h"
#import "FirstFirstViewController.h"
#import "Define.h"
#import "CustomColor.h"
#import "EditViewController.h"
#import "ForthViewController.h"
#import "QuickLookViewController.h"
#import "EGOlibraryTableViewController.h"
#import "FBTableViewController.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "ViewMasterAppDelegate.h"
#import "SectionTableViewController.h"


//#import "TableEditTableViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)init {
    
    self = [super initWithNibName:nil bundle:nil];
        if (self) {
        self.title = H_TITLE_FIRST;
        
        _items = [NSMutableArray arrayWithCapacity:20];
        
        [_items addObject:@"WebViewController"];
        [_items addObject:@"FirstFirstViewController"];
        [_items addObject:@"EditViewController"];
        [_items addObject:@"StoryboardViewController"];
        [_items addObject:@"QuickLookViewController"];
        [_items addObject:@"EGOlibraryTableViewController"];
        [_items addObject:@"FBTableViewController"];
        [_items addObject:@"REMenuViewController"];
        [_items addObject:@"SWTableViewController"];
        [_items addObject:@"SectionTableViewController"];
            
        [UINavigationBar appearance].barTintColor = PINC_COLOR;
//        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:COLOR_MAIN_COLOR]];

        
            //#FF0066
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //次画面にBackボタンを設定する
    UIBarButtonItem *backbtn = [[UIBarButtonItem alloc]init];
    backbtn.title = H_BUTTON_BACK;
    self.navigationItem.backBarButtonItem = backbtn;
    
    NSString *pstrErrMessage = [NSString stringWithFormat:MSG_REQUIRED_ERR, SUBMSG_FOLDERNAME_ERR];
    NSLog(@"%@",pstrErrMessage);
    
    
}

#pragma mark - UITableViewDataSource


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"FirstViewControler  セルの数を返すnumberOfRowsInSection");
    return _items.count;
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  //セルについて
//    NSLog(@"FirstViewControler  cellForRowAtIndexPath");
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    NSString *item = [_items objectAtIndex:indexPath.row];   //Arrayの中身をStringに代入
    cell.textLabel.text = item;                              //それをtextlabelに代入している
    cell.imageView.image = [UIImage imageNamed:ICON_HEART];  //アイコンを設定
    
    
//  cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;   //➡️に着いてる矢印みたいなやつの表示スタイル

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;      //セルの➡️のスタイルの変更
    
    return cell;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {  //cellをタップされたときの処理を記述
//画面遷移
    if (indexPath.row == 0){
        zero = [[ZeroViewController alloc] init];
        zero.FirstFlog = 0;
        [self.navigationController pushViewController:zero animated:YES];
    } else if (indexPath.row == 1){
        first = [[FirstFirstViewController alloc] init];
        [self.navigationController pushViewController:first animated:YES];
    } else if (indexPath.row == 2){
        table = [[EditViewController alloc] init];
        [self.navigationController pushViewController:table animated:YES];
    } else if (indexPath.row == 3){
        
//        forthView = [[ForthViewController alloc] init];
//        
//        NSString *storyboardName = @"ForthViewController";
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
//        UIViewController *con = [sb instantiateInitialViewController];
//        [self.navigationController pushViewController:con animated:YES];

        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ForthViewController" bundle:nil];     //ファイル名
        UINavigationController *navi =
        [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"favoriteViewController"]];                //StoryboardID
        
        [self presentViewController:navi animated:YES completion:nil];

        
        

        
 //       forthView = [[ForthViewController alloc] init];
        
 //       [self.navigationController pushViewController:forthView animated:YES];
    } else if (indexPath.row == 4){
        quickView = [[QuickLookViewController alloc] init];
        [self.navigationController pushViewController:quickView animated:YES];
    } else if (indexPath.row == 5){
        egolibrary = [[EGOlibraryTableViewController alloc] init];
        [self.navigationController pushViewController:egolibrary animated:YES];
    } else if (indexPath.row == 6){
        fbTableView = [[FBTableViewController alloc] init];
        [self.navigationController pushViewController:fbTableView animated:YES];
    } else if (indexPath.row == 7){
        homeRemenu = [[HomeViewController alloc] init];
         NavigationViewController *navigation = [[NavigationViewController alloc] initWithRootViewController:homeRemenu];

        [self.navigationController presentModalViewController:navigation animated:YES];
//        [self.navigationController pushViewController:navigation animated:YES];
    } else if (indexPath.row == 8){
        swtableview = [[SWTableViewController alloc] init];
        [self.navigationController pushViewController:swtableview animated:YES];
    } else if (indexPath.row == 9){
        sectionTable= [[SectionTableViewController alloc] init];
        [self.navigationController pushViewController:sectionTable animated:YES];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

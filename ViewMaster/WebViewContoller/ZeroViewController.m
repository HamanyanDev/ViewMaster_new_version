//
//  ZeroViewController.m
//  ViewMaster
//
//  Created by bearbrick on 2014/09/17.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "ZeroViewController.h"
#import "WebViewController.h"
#import "FileManageHelp.h"
#import "Define.h"


@interface ZeroViewController ()
@property (weak, nonatomic) IBOutlet UITableView *PicChoiceTableView;
@property NSMutableArray *items;

@end

@implementation ZeroViewController
@synthesize FirstFlog;
@synthesize items;

//NSMutableArray *items;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    items = [NSMutableArray arrayWithCapacity:30];
    
    _PicChoiceTableView.dataSource = self;
    _PicChoiceTableView.delegate = self;
    
    [items addObject:@"sample.jpeg"];
    [items addObject:@"sample.pdf"];
    [items addObject:@"sample_3s.xls"];
    [items addObject:@"sample.xlsx"];
    [items addObject:@"sample_3s.doc"];
    [items addObject:@"sample.docx"];
    [items addObject:@"sampleA.png"];
    [items addObject:@"sample.rtf"];
    [items addObject:@"sample.txt"];
    [items addObject:@"sample_pass.pdf"];
    [items addObject:@"sample.broken"];
    [items addObject:@"sample.ppt"];
    [items addObject:@"sample.pptx"];
    [items addObject:@"sample.gif"];
    [items addObject:@"sample.jpe"];
    [items addObject:@"sample.jpg"];
    [items addObject:@"sample.gif"];
    [items addObject:@"sample.tiff"];
    [items addObject:@"sample.tif"];
    [items addObject:@"sample.csv"];
    [items addObject:@"samplea.numbers"];
    [items addObject:@"sample.pages"];
    [items addObject:@"samplea.numbers.zip"];
    [items addObject:@"sample.pages.zip"];
    [items addObject:@"sample.key"];
    [items addObject:@"sample.key.zip"];
    [items addObject:@"sample.rtf"];
    [items addObject:@"sample.rtfd.zip"];
    [items addObject:@"sample.rtfd"];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_EDIT
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(EditButtonTap)];

    
}




- (void)EditButtonTap{
    
    [self.PicChoiceTableView setEditing:!_PicChoiceTableView.editing animated:YES];  //Editモードに移行する
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"zeroViewControler  セルの数を返すnumberOfRowsInSection");
    return items.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  //セルについて
    NSLog(@"zeroViewControler  cellForRowAtIndexPath");
    
    UITableViewCell *cell = [_PicChoiceTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    NSString *item = [items objectAtIndex:indexPath.row];   //Arrayの中身をStringに代入
    cell.textLabel.text = item;                              //それをtextlabelに代入している
    cell.imageView.image = [UIImage imageNamed:item];
    cell.detailTextLabel.text = @"size:500MG, update:2014/06/09";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;    //セルの>のスタイルの変更
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title = nil;
    if(section == 0){
        title = @"section1";
    } else {
        title = @"section2";
    }
    return title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    webview = [[WebViewController alloc] init];
    
    switch (indexPath.row) {
        case 0:
            webview.CellNumberFlag = 0;
            break;
        case 1:
            webview.CellNumberFlag = 1;
            break;
        case 2:
            webview.CellNumberFlag = 2;
            break;
        case 3:
            webview.CellNumberFlag = 3;
            break;
        case 4:
            webview.CellNumberFlag = 4;
            break;
        case 5:
            webview.CellNumberFlag = 5;
            break;
        case 6:
            webview.CellNumberFlag = 6;
            break;
        case 7:
            webview.CellNumberFlag = 7;
            break;
        case 8:
            webview.CellNumberFlag = 8;
            break;
        case 9:
            webview.CellNumberFlag = 9;
            break;
        case 10:
            webview.CellNumberFlag = 10;
            break;
        case 11:
            webview.CellNumberFlag = 11;
            break;
        case 12:
            webview.CellNumberFlag = 12;
            break;
        case 13:
            webview.CellNumberFlag = 13;
            break;
        case 14:
            webview.CellNumberFlag = 14;
            break;
        case 15:
            webview.CellNumberFlag = 15;
            break;
        case 16:
            webview.CellNumberFlag = 16;
            break;
        case 17:
            webview.CellNumberFlag = 17;
            break;
        case 18:
            webview.CellNumberFlag = 18;
            break;
        case 19:
            webview.CellNumberFlag = 19;
            break;
        case 20:
            webview.CellNumberFlag = 20;
            break;
        case 21:
            webview.CellNumberFlag = 21;
            break;
        case 22:
            webview.CellNumberFlag = 22;
            break;
        case 23:
            webview.CellNumberFlag = 23;
            break;
        case 24:
            webview.CellNumberFlag = 24;
            break;
        case 25:
            webview.CellNumberFlag = 25;
            break;
        case 26:
            webview.CellNumberFlag = 26;
            break;
        case 27:
            webview.CellNumberFlag = 27;
            break;
        case 28:
            webview.CellNumberFlag = 28;
            break;
    }
    
    [self.navigationController pushViewController:webview animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return H_CELL_HIGH;
}



@end

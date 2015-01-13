//
//  CreateFolderViewController.m
//  ViewMaster
//
//  Created by tvt on 2014/09/22.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "CreateFolderViewController.h"
#import "FirstFirstViewController.h"
#import "FileManageHelp.h"
#import "ForAlertDialog.h"
#import "Define.h"


@interface CreateFolderViewController ()
- (IBAction)Tap_Cancel:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *Cancel_button;
@property (weak, nonatomic) IBOutlet UIButton *Save_Button;
- (IBAction)button_Save:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *FolderName;


@end

@implementation CreateFolderViewController
@synthesize check_from_airdrop;


NSString *FolderNameText;
BOOL check_from_airdrop = false;

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
    
    self.FolderName.delegate = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_CANCEL
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(didTapCancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_SAVE
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(didTapSave)];

    
    if(check_from_airdrop == false) {                   //AirDropではない
        NSLog(@"IF_true");
        self.Save_Button.hidden = YES;                  //非表示にする
        self.Cancel_button.hidden = YES;
    } else {                                            //AirDropからの呼び出し
        NSLog(@"IF_false");
        self.Save_Button.hidden = NO;                   //表示にする
        self.Cancel_button.hidden = NO;
    }

}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillapper");
    
    self.FolderName.text = nil;
}


- (void)didTapCancel{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didTapSave{
    
    FolderNameText = self.FolderName.text;
    NSLog(@"CreateFolderView  text;%@",FolderNameText);
    
//
//    NSString *homeDir = NSHomeDirectory();
//    NSLog(@"CreateFolderView  homeDir;%@",homeDir);
//    
//    NSString *dirPath = [homeDir stringByAppendingPathComponent:FolderNameText];
//    NSLog(@"CreateFolderView  dirPath;%@",dirPath);
//
//    //ディレクトリの作成
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error;
//    
//    BOOL result = [fileManager createDirectoryAtPath:dirPath
//                   withIntermediateDirectories:YES attributes:nil error:&error];
//    
//    if(result) {
//        NSLog(@"success:");
//    }else {
//        NSLog(@"fail: %@",error.description);
//    }

    FileManageHelp *fileManage = [[FileManageHelp alloc] init];
    NSString *DocumentsDirPath = [fileManage documentDirectoryWithFileName:FolderNameText];   //Document配下に入力されたフォルダ名のディレクトリを作成する

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    BOOL result = [fileManager createDirectoryAtPath:DocumentsDirPath
                withIntermediateDirectories:YES attributes:nil error:&error];
    
    if(result) {
        NSLog(@"success:");
        [self dismissViewControllerAnimated:YES completion:nil];

    }else {
        NSLog(@"fail: %@",error.description);
        ForAlertDialog *alert = [[ForAlertDialog alloc] init];
        [alert showYesNoDialog:@"フォルダ作成失敗" text:@"もう一度やり直してください"];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    NSLog(@"textFieldDidEndEditing");
}

- (NSString*)ReturnText
{
    return FolderNameText;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];    //キーボードを下げる
    
    return NO;       //改行を入れない
}


- (IBAction)button_Save:(UIButton *)sender {
    
    FolderNameText = self.FolderName.text;
    NSLog(@"button_save_yellow  text;%@",FolderNameText);
    
    //
    //    NSString *homeDir = NSHomeDirectory();
    //    NSLog(@"CreateFolderView  homeDir;%@",homeDir);
    //
    //    NSString *dirPath = [homeDir stringByAppendingPathComponent:FolderNameText];
    //    NSLog(@"CreateFolderView  dirPath;%@",dirPath);
    //
    //    //ディレクトリの作成
    //    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    NSError *error;
    //
    //    BOOL result = [fileManager createDirectoryAtPath:dirPath
    //                   withIntermediateDirectories:YES attributes:nil error:&error];
    //
    //    if(result) {
    //        NSLog(@"success:");
    //    }else {
    //        NSLog(@"fail: %@",error.description);
    //    }
    
    FileManageHelp *fileManage = [[FileManageHelp alloc] init];
    NSString *DocumentsDirPath = [fileManage documentDirectoryWithFileName:FolderNameText];   //Document配下に入力されたフォルダ名のディレクトリを作成する
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    BOOL result = [fileManager createDirectoryAtPath:DocumentsDirPath
                         withIntermediateDirectories:YES attributes:nil error:&error];
    
    if(result) {
        NSLog(@"success:");
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else {
        NSLog(@"fail: %@",error.description);
        ForAlertDialog *alert = [[ForAlertDialog alloc] init];
        [alert showYesNoDialog:@"フォルダ作成失敗" text:@"もう一度やり直してください"];
    }
    
}
- (IBAction)Tap_Cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end

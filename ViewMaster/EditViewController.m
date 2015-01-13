//
//  EditViewController.m
//  ViewMaster
//
//  Created by tvt on 2014/10/03.
//  Copyright (c) 2014年 HiroyukiHamana. All rights reserved.
//

#import "EditViewController.h"
#import "Define.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *row;

@end

@implementation EditViewController
//
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    
   self.title = @"Editting";
    self.row = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i<100; i++){
        NSString *cellTitle = [NSString stringWithFormat:@"仮フォルダ%d",i];
        [_row addObject:cellTitle];
    }
        NSLog(@"awakeFromnib_end");
    
    return self;

}




- (void)viewDidLoad {
    NSLog(@"haa____viewDidLoad__EditViewController");
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:H_BUTTON_EDIT
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(didTapEditButton)];
}

- (void)didTapEditButton {
    [_tableView setEditing:!_tableView.editing animated:YES];
    
    
    NSLog(@"editモード");
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _row.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"EditView cellForRowAtIndexPath");
    NSString *reuseldentifier = @"CellID";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:reuseldentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseldentifier];
    }
    
    NSString *title = [_row objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    cell.imageView.image = [UIImage imageNamed:ICON_DIRECT];
    
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"commitEditingStyle");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_row removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"canMoveRowAtIndexPath");
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"moveRowAtIndexPath");
    if (destinationIndexPath.row < _row.count) {
        NSString *title = [_row objectAtIndex:sourceIndexPath.row];
        [_row removeObjectAtIndex:sourceIndexPath.row];
        [_row insertObject:title atIndex:destinationIndexPath.row];
    }
}
















@end

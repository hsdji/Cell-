//
//  ViewController.m
//  Tableview
//
//  Created by ehome on 16/7/1.
//
//

#import "ViewController.h"
#import "MoveTableViewController.h"
#import "DeleteTableViewController.h"
#import "InsertTableViewController.h"

#define CELL   @"cell"

@interface ViewController ()
{
    IBOutlet UITableView *vTableview;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [vTableview registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - 
#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"cell移动";
            break;
        case 1:
            cell.textLabel.text = @"cell删除";
            break;
        case 2:
            cell.textLabel.text = @"cell添加";
            break;
        default:
            break;
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
         MoveTableViewController *moveVC = [[MoveTableViewController alloc] init];
        [self.navigationController pushViewController:moveVC animated:YES];
    }else if (indexPath.row == 1){
        DeleteTableViewController *deleteVC = [[DeleteTableViewController alloc] init];
        [self.navigationController pushViewController:deleteVC animated:YES];
    }else if (indexPath.row == 2){
        InsertTableViewController *insertVC = [[InsertTableViewController alloc] init];
        [self.navigationController pushViewController:insertVC animated:YES];
    }
}

@end

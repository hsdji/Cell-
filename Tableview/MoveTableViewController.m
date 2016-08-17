//
//  MoveTableViewController.m
//  Tableview
//
//  Created by 智慧杰 on 16/7/1.
//
//

#import "MoveTableViewController.h"

#define MOVE    @"move"

@interface MoveTableViewController ()
{
    NSMutableArray *vcNrray;
}
@end

@implementation MoveTableViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        vcNrray = [@[@"a",@"b",@"c",@"h",@"d",@"ds",@"sd",@"fd",@"gdd",@"ad"] mutableCopy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MOVE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [vcNrray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MOVE forIndexPath:indexPath];
    cell.textLabel.text = vcNrray[indexPath.row];
    return cell;
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
      toIndexPath:(NSIndexPath *)toIndexPath
{
    id object = [vcNrray objectAtIndex:fromIndexPath.row];
    [vcNrray removeObjectAtIndex:fromIndexPath.row];
    [vcNrray insertObject:object atIndex:toIndexPath.row];
}


@end

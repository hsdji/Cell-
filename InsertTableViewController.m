//
//  InsertTableViewController.m
//  Tableview
//
//  Created by 智慧杰 on 16/7/1.
//
//

#import "InsertTableViewController.h"

#define INSERT    @"insert"

@interface InsertTableViewController ()
{
    NSMutableArray *vcNrray;
}
@end

@implementation InsertTableViewController


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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:INSERT];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:INSERT forIndexPath:indexPath];
    cell.textLabel.text = vcNrray[indexPath.row];
    return cell;
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [vcNrray insertObject:@"111" atIndex:indexPath.row];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


@end

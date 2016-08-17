//
//  DeleteTableViewController.m
//  Tableview
//
//  Created by 智慧杰 on 16/7/1.
//
//

#import "DeleteTableViewController.h"

#define DELETE    @"delete"

@interface DeleteTableViewController ()
{
    NSMutableArray *vcNrray;
}
@end

@implementation DeleteTableViewController

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DELETE];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DELETE forIndexPath:indexPath];
    cell.textLabel.text = vcNrray[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    [vcNrray removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}


-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *more = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"验证" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"验证");
    }];
    
    UITableViewRowAction *music = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"音乐" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"Music");
    }];
    
    UITableViewRowAction *video = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"电影" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"movie-------------------------%ld",indexPath.row);
    }];
    video.backgroundColor = [UIColor yellowColor];
    video.backgroundEffect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleExtraLight)];

    
    return @[more,music,video];
}


-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{

    return @"wobuzidakfkd";
}




-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}


-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"#",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
   
    UILabel *lab = [UILabel new];
    lab.frame = CGRectMake(100, 100, 40, 40);
    lab.alpha= 0.5;
    lab.text = title;
    lab.backgroundColor = [UIColor lightGrayColor];
    [self.tableView addSubview:lab];
    return 0;
}


@end

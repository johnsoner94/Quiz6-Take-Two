//
//  Q6MasterViewController.m
//  Quiz6TakeTwo
//
//  Created by Emily Johnson on 3/31/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "Q6MasterViewController.h"

#import "Q6DetailViewController.h"

#import "Task.h"

@interface Q6MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation Q6MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"My Tasks"];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView:) name:@"DetailDone" object:nil];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

    [self.tableView setDelegate:self];
}

- (void) refreshView:(NSNotification *)notification {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[[Task alloc] init] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Task *t = _objects[indexPath.row];
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterLongStyle];
    
    [cell.textLabel setText: t.taskName];
    [cell.textLabel setTextColor:[UIColor colorWithRed:t.urgency green:1.-[t urgency] blue:0.0 alpha:1]];
    [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    
    [cell.detailTextLabel setText: [NSString stringWithFormat:@"%@ (%.f)", [df stringFromDate:t.dueDate], t.urgency*10]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Q6DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TaskView"];
    Task *t = [_objects objectAtIndex:[indexPath row]];
    [dvc setDetailItem:t];
    [dvc setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    [dvc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:dvc animated:YES completion:nil];
}

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

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}



@end

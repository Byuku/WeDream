//
//  WDSMasterViewController.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSMasterViewController.h"
#import "WDSDetailViewController.h"
#import "WDSHelperIndexedList.h"
#import "WDSFriend.h"

@interface WDSMasterViewController () {
        NSArray * _objects;
        NSArray *indices;
        NSArray * _friends;
}
@end

@implementation WDSMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

<<<<<<< HEAD
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"Some Title";
    message.description = @"Amazing Sunset";
    [message setThumbImage:[UIImage imageNamed:@"default_image"]];
    
    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res1"ofType:@"jpg"];
    ext.imageData = [NSData dataWithContentsOfFile:filePath];
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
=======
    self.title = @"Friends dream";
    
    WDSFriend *friend1 = [[WDSFriend alloc] initWithParams:@"Tracy" :nil];
    WDSFriend *friend2 = [[WDSFriend alloc] initWithParams:@"Steeve" :nil];
    WDSFriend *friend3 = [[WDSFriend alloc] initWithParams:@"Flav" :nil];
    WDSFriend *friend4 = [[WDSFriend alloc] initWithParams:@"Dorian" :nil];
    
    _friends = [[NSArray alloc] initWithObjects:friend1, friend2, friend3, friend4, nil];
    
    _objects = [WDSHelperIndexedList addContentInIndexedList:[WDSHelperIndexedList createDictionnaryForIndexedList:_friends :@"name"]];
    
    indices = [_objects valueForKey:@"headerTitle"];
>>>>>>> flav
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _objects.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[_objects objectAtIndex:section] objectForKey:@"rowValues"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[_objects objectAtIndex:indexPath.section] objectForKey:@"rowValues"]
                           objectAtIndex:indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
	return [[_objects objectAtIndex:section] objectForKey:@"headerTitle"];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [_objects valueForKey:@"headerTitle"];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [indices indexOfObject:title];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString * name = [[[_objects objectAtIndex:indexPath.section] objectForKey:@"rowValues"]
                           objectAtIndex:indexPath.row];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", name];
        NSArray *filteredArray = [_friends filteredArrayUsingPredicate:predicate];
        
        
        [[segue destinationViewController] setDetailItem:[filteredArray objectAtIndex:0]];
    }
}
@end

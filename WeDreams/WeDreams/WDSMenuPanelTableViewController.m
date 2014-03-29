//
//  HMSMenuPanelTableViewController.m
//  HMS
//
//  Created by flav on 21/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSMenuPanelTableViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

#import "WDSCollectionViewController.h"

@interface WDSMenuPanelTableViewController ()
{
    NSArray * _objects;
}

@end

@implementation WDSMenuPanelTableViewController

static NSString *all = @"All dreams";
static NSString *inprogress = @"In progress dreams";
static NSString *realized = @"Realized dreams";


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _objects = [[NSArray alloc] initWithObjects:all, inprogress, realized, nil];
    
    // under status bar
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3" forIndexPath:indexPath];
    
    cell.textLabel.text = _objects[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

   // NSLog(@"%@",_objects[indexPath.row]);

    if (indexPath.row == 0)
    {
        UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
        WDSCollectionViewController * cv = nav.viewControllers[0];
        cv.status = WDSStatusAll;
        self.sidePanelController.centerPanel = nav;
        
    }
   else if (indexPath.row == 1)
    {
        
        UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
        WDSCollectionViewController * cv = nav.viewControllers[0];
        cv.status = WDSStatusCurrent;
        self.sidePanelController.centerPanel = nav;
        
    }
   else
    {
        
        UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
        WDSCollectionViewController * cv = nav.viewControllers[0];
        cv.status = WDSStatusFinished;
        self.sidePanelController.centerPanel = nav;
    }

    [[self sidePanelController] toggleLeftPanel:nil];
    
    
    
}


@end

//
//  WDSCollectionViewController.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSCollectionViewController.h"
#import "WDSAddDreamViewController.h"
#import "WDSShareDreamViewController.h"


#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface WDSCollectionViewController ()
{
    NSMutableArray *_dreams;
}

@end

@implementation WDSCollectionViewController

static NSString *inprogress = @"In progress";
static NSString *realized = @"Realized";

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
    
    self.navigationController.navigationBar.translucent = NO;

    
    if (self.status != WDSStatusFinished)
    {
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addDream:)];
        self.navigationItem.rightBarButtonItem = addButton;
    }
    // Do any additional setup after loading the view.

    
    WDSDream *d1 = [[WDSDream alloc] initWithParams:@"mon reve1" :@"mon reve1 est trop bienasndbansbdh basdhbasdjha asdjkhjkashd asdhjasjkdh asjkhd asjhd " :WDSStatusCurrent];
    WDSDream *d2 = [[WDSDream alloc] initWithParams:@"mon reve2" :@"mon reve2 est trop bien" :WDSStatusCurrent];
    WDSDream *d3 = [[WDSDream alloc] initWithParams:@"mon reve3" :@"mon reve3 est trop bien" :WDSStatusCurrent];
    WDSDream *d4 = [[WDSDream alloc] initWithParams:@"mon reve4" :@"mon reve4 est trop bien" :WDSStatusFinished];
    WDSDream *d5 = [[WDSDream alloc] initWithParams:@"mon reve5" :@"mon reve5 est trop bien" :WDSStatusFinished];
    WDSDream *d6 = [[WDSDream alloc] initWithParams:@"mon reve6" :@"mon reve6 est trop bien" :WDSStatusFinished];
    
    _dreams = [[NSMutableArray alloc]initWithObjects:d1, d2, d3, d4, d5, d6, nil];
    
    if (self.status != WDSStatusAll)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %ld", @"status", self.status];
        NSArray *filteredArray = [_dreams filteredArrayUsingPredicate:predicate];
        
        _dreams = [filteredArray mutableCopy];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dreams.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellCollection";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //effet damier
    if (indexPath.row % 2)
        cell.backgroundColor = [UIColor redColor];
    else
        cell.backgroundColor = [UIColor blueColor];
    
    UILabel * title = (UILabel* ) [cell viewWithTag:100];
    title.text = [[_dreams objectAtIndex:indexPath.row] title];

    UILabel * status = (UILabel* ) [cell viewWithTag:101];

    status.text = ([[_dreams objectAtIndex:indexPath.row] status] == WDSStatusCurrent) ? inprogress : realized;
    
    if (indexPath.row % 2)
    {
        cell.backgroundColor = [UIColor colorWithRed:0.941 green:0.937 blue:0.937 alpha:1];
        title.textColor = [UIColor colorWithRed:0.467 green:0.682 blue:0.243 alpha:1];
        status.textColor = [UIColor colorWithRed:0.467 green:0.682 blue:0.243 alpha:1];
    }
    
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:0.467 green:0.682 blue:0.243 alpha:1];
        title.textColor = [UIColor colorWithRed:0.941 green:0.937 blue:0.937 alpha:1];
        status.textColor = [UIColor colorWithRed:0.941 green:0.937 blue:0.937 alpha:1];
    }
    
    return cell;
}


-(void)addDream:(UIBarButtonItem *)sender
{
    WDSAddDreamViewController * ad = [self.storyboard instantiateViewControllerWithIdentifier:@"addDreamViewController"];
    ad.status = self.status;
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:ad];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
    if ([[segue identifier] isEqualToString:@"showDreamDetail"])
    {
     
        NSIndexPath *IndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        NSArray *params = [[NSArray alloc] initWithObjects:[[NSString alloc] initWithFormat:@"%u", self.status], [_dreams objectAtIndex:IndexPath.row], nil];
        
        [[segue destinationViewController] setDetailItem:params];
        
    }
}

@end

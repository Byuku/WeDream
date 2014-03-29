//
//  WDSShareDreamViewController.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSShareDreamViewController.h"
#import "WDSAddDreamViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "WeChatManager.h"

@interface WDSShareDreamViewController ()

@end

@implementation WDSShareDreamViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {

        self.status = [self.detailItem[0] intValue];
        self.nameLabel.text = [self.detailItem[1] title];
        self.descriptionLabel.text = [self.detailItem[1] description];
    }
}


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
    // Do any additional setup after loading the view.
    [self configureView];

    if ([self.detailItem[1] status] == WDSStatusFinished)
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareDream:(id)sender
{
   UIButton * button = (UIButton *) sender;

    if (button.tag == 105)
        [WeChatManager changeSharingMode:WXSceneSession];
    else
        [WeChatManager changeSharingMode:WXSceneTimeline];
        
    [WeChatManager sendTextContent:[[NSString alloc] initWithFormat:@"Dream: %@ (%@)", self.nameLabel.text, self.descriptionLabel.text]];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showEditDetail"])
    {
        [[segue destinationViewController] setStatus:self.status];
        [[segue destinationViewController] setDetailItem:_detailItem[1]];
    }
}

@end

//
//  WDSAddDreamViewController.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSAddDreamViewController.h"
#import "WDSCollectionViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "WeChatManager.h"

@interface WDSAddDreamViewController ()

@end

@implementation WDSAddDreamViewController

static NSString *placerholderTextView = @"Description of your dream ...";

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
        self.nameTextField.text = [self.detailItem title];
        self.descriptionTextView.text = [self.detailItem description];
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
    [self configureView];
    // Do any additional setup after loading the view.
 
    self.navigationController.navigationBar.translucent = NO;
    self.nameTextField.delegate = self;
    self.descriptionTextView.delegate = self;
    if ([self.descriptionTextView.text isEqualToString:@""])
    {
        self.descriptionTextView.text = placerholderTextView;
        self.descriptionTextView.textColor = [UIColor lightGrayColor];
    }
  
    self.nameLabel.text = @"Title";
    self.descriptionLabel.text = @"Description";
    
    [WeChatManager changeSharingMode:WXSceneTimeline];
    [WeChatManager sendLinkContent:@"CostardRouge.eu" : @"Steeve Pommier's portfolio" : @"http:://www.costardrouge.eu" : [UIImage imageNamed:@"lol.png"]];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validationDream:(id)sender
{
    if (![self.nameTextField.text isEqualToString:@"" ] && ![self.descriptionTextView.text isEqualToString:@""])
    {
        UINavigationController * nav = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
        WDSCollectionViewController * cv = nav.viewControllers[0];
        cv.status = self.status;
        self.sidePanelController.centerPanel = nav;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:placerholderTextView]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = placerholderTextView;
        textView.textColor = [UIColor lightGrayColor];
    }
    [textView resignFirstResponder];
}


@end

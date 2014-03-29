//
//  WDSAddDreamViewController.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSAddDreamViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "WeChatManager.h"

@interface WDSAddDreamViewController ()

@end

@implementation WDSAddDreamViewController

static NSString *placerholderTextView = @"Description of your dream ...";

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
 
    self.navigationController.navigationBar.translucent = NO;
    self.nameTextField.delegate = self;
    self.descriptionTextView.delegate = self;
    self.descriptionTextView.text = placerholderTextView;
    self.descriptionTextView.textColor = [UIColor lightGrayColor];
    
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
    NSLog(@"%@, %@", self.nameTextField.text, self.descriptionTextView.text);
    
    if (![self.nameTextField.text isEqualToString:@"" ]&& ![self.descriptionTextView.text isEqualToString:@""])
        self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

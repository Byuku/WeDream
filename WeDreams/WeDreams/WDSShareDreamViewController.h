//
//  WDSShareDreamViewController.h
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDSShareDreamViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) id detailItem;

@end

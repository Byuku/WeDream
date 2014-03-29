//
//  WDSDetailViewController.h
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDSDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

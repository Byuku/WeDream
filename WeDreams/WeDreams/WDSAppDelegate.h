//
//  WDSAppDelegate.h
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WXApi.h"

@interface WDSAppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>
{
    enum WXScene _scene;
}

@property (strong, nonatomic) UIWindow *window;

@end

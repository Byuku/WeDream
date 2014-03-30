//
//  WDSFriends.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSFriend.h"

@implementation WDSFriend

- (id)initWithParams:(NSString *)name :(NSMutableArray *)dreamList;
{
    
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.dreamList = dreamList;
    }
    
    return self;
}

@end

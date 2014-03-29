//
//  WDSDream.m
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import "WDSDream.h"

@implementation WDSDream


- (id)initWithParams:(NSString *)title :(NSString *)description :(NSString *)author
{
    
    self = [super init];
    
    if (self)
    {
        self.title = title;
        self.description = description;
        self.author = author;
    }
    
    return self;
}

@end

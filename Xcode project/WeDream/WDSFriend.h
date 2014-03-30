//
//  WDSFriends.h
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDSFriend : NSObject

@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSMutableArray * dreamList;

- (id)initWithParams:(NSString *)name :(NSMutableArray *)dreamList;


@end

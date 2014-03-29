//
//  WDSDream.h
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDSDream : NSObject

@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * description;
@property (nonatomic,strong) NSString * author;

- (id)initWithParams:(NSString *)title :(NSString *)description :(NSString *)author;


@end

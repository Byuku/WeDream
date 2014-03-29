//
//  WDSDream.h
//  WeDreams
//
//  Created by flav on 29/03/2014.
//  Copyright (c) 2014 flav. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _WDSStatus {
    WDSStatusCurrent = 0,
    WDSStatusFinished,
} WDSStatus;

@interface WDSDream : NSObject

@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * description;
@property (nonatomic,assign) WDSStatus status;

- (id)initWithParams:(NSString *)title :(NSString *)description :(WDSStatus) status;


@end

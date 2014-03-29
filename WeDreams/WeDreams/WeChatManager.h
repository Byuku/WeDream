//
//  SendMsgToWechatMgr.h
//  SDKSample
//
//  Created by Tencent on 6/23/13.
//
//

#import <Foundation/Foundation.h>

#import "WXApi.h"

enum WXScene _scene;

@interface WeChatManager : NSObject <WXApiDelegate>
{
    
}

+(void) sendLinkContent;

@end

//
//  SendMsgToWechatMgr.h
//  SDKSample
//
//  Created by Tencent on 6/23/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WXApi.h"

enum WXScene _scene;  // WXSceneSession (for contact), WXSceneTimeline (for moment)

@interface WeChatManager : NSObject <WXApiDelegate>

// Helper method
+(void) changeSharingMode:(NSInteger)scene;

// Callback methods (request / response)
+(void) onReq:(BaseReq*)req;
+(void) onResp:(BaseResp*)resp;

// Response methods
+(void) RespTextContent;    // OK
+(void) RespImageContent;   // OK
+(void) RespLinkContent;    // OK

+(void) RespMusicContent;
+(void) RespVideoContent;
+(void) RespAppContent;
+(void) RespNonGifContent;
+(void) RespGifContent;
+(void) RespFileContent;
+(void) RespEmoticonContent;

// Sharing method (OK)
+(void) sendTextContent: (NSString *)message;
+(void) sendImageContent:(UIImage *)image;
+(void) sendLinkContent: (NSString *)title :(NSString *)description :(NSString *)url :(UIImage *)image;


+(void) sendMusicContent;
+(void) sendVideoContent;
+(void) sendAppContent;
+(void) sendNonGifContent;
+(void) sendGifContent;
+(void) sendFileContent;

@end

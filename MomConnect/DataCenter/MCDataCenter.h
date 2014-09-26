//
//  MCDataCenter.h
//  MomConnect
//
//  Created by Chandu on 27/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GetRequestType,
    PostRequestType,
    PutRequestType,
    DeleteRequestType
} RequestType;

typedef void(^SuccessBlock)(id response);
typedef void(^FailureBlock)(NSError *error);

@interface MCDataCenter : NSObject

+ (MCDataCenter *)sharedCenter;

- (void)getResponseWithUrlEndPoint:(NSString *)endPoint urlParameters:(NSDictionary *)parameters requestType:(RequestType)requestType successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end

//
//  MCDataCenter.m
//  MomConnect
//
//  Created by Chandu on 27/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "MCDataCenter.h"
#import "AFNetworking.h"
#import "MCUtilities.h"
#import "MCAppConstants.h"

@implementation MCDataCenter

+ (MCDataCenter *)sharedCenter {
    static MCDataCenter *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (void)getResponseWithUrlEndPoint:(NSString *)endPoint urlParameters:(NSDictionary *)parameters requestType:(RequestType)requestType successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    if (requestType == GetRequestType) {
        [self sendGetRequestWithUrlEndPoint:endPoint urlParameters:parameters successBlock:successBlock failureBlock:failureBlock];
    }
    else if (requestType == PostRequestType) {
        [self sendPostRequestWithEndPoint:endPoint urlParameters:parameters successBlock:successBlock failureBlock:failureBlock];
    }
    else if (requestType == PutRequestType) {
        [self sendPutRequestWithEndPoint:endPoint urlParameters:parameters successBlock:successBlock failureBlock:failureBlock];
    }
    else if (requestType == DeleteRequestType) {
        [self sendDeleteRequestWithEndPoint:endPoint urlParameters:parameters successBlock:successBlock failureBlock:failureBlock];
    }
}

#pragma-mark GET request

- (void)sendGetRequestWithUrlEndPoint:(NSString *)endPoint urlParameters:(NSDictionary *)parameters successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock  {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [self setAcceptHeadersforManager:manager];
    [manager GET:[NSString stringWithFormat:@"%@/%@", MCAPP_BUILD_BASE_URL, endPoint] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

#pragma-mark POST request

- (void)sendPostRequestWithEndPoint:(NSString *)endPoint urlParameters:(NSDictionary *)parameters successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [self setAcceptHeadersforManager:manager];
    [manager POST:[NSString stringWithFormat:@"%@/%@", MCAPP_BUILD_BASE_URL, endPoint] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

#pragma-mark PUT request

- (void)sendPutRequestWithEndPoint:(NSString *)endPoint urlParameters:(NSDictionary *)parameters successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [self setAcceptHeadersforManager:manager];
    [manager PUT:[NSString stringWithFormat:@"%@/%@", MCAPP_BUILD_BASE_URL, endPoint] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

#pragma mark - Delete Request

- (void)sendDeleteRequestWithEndPoint:(NSString *)endPoint urlParameters:(NSDictionary *)parameters successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [self setAcceptHeadersforManager:manager];
    [manager DELETE:[NSString stringWithFormat:@"%@/%@", MCAPP_BUILD_BASE_URL, endPoint] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    }];
}

#pragma mark - Utility

#define ACCEPT_HEADER_VALUE @""
#define ACCEPT_HEADER_KEY @""
#define ACCEPT_AUTH_TOKEN_KEY @"OWQwMjJmZDI2OTJhNGYzYjRhNDJjNjQ3OGE3ZWZj"

- (void)setAcceptHeadersforManager:(AFHTTPRequestOperationManager *)manager {
    [manager.requestSerializer setValue:ACCEPT_HEADER_VALUE forHTTPHeaderField:ACCEPT_HEADER_KEY];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:ACCEPT_AUTH_TOKEN_KEY];
}

@end

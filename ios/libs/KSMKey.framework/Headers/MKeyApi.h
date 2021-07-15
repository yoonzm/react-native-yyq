//
//  MKeyApi.h
//  MKeySdk
//
//  Created by lic&z on 2018/4/13.
//  Copyright © 2018年 lic&z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KSMKey/MResultBean.h>
#import <KSMKey/MKeyMacro.h>

@interface MKeyApi : NSObject

/**
 初始化SDK访问地址和服务CODE
 @param url SDK访问地址
 @param code 证书容器标识，用于区分多套证书
 */
+ (void)initSDK:(NSString *)url serverCode:(NSString *)code NS_DEPRECATED_IOS(8_0, 10_0,"use [initSDK:contCode:] instead");
+ (void)initSDK:(NSString *)url contCode:(NSString *)code;

/**
 MKeyApi单例
 @param appId 应用id
 @param appCode SDK授权码
 @param userInfo 用户信息
 @return MKeyApi对象
 */
+ (instancetype)getInstance:(NSString *)appId appCode:(NSString *)appCode userInfo:(NSString *)userInfo;


/**
 申请证书
 @param pin 设置的证书密码
 @param resultBlock 回调结果
 */
- (void)applyCert:(NSString *)pin resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
读取证书容器标识列表
@param resultBlock 回调结果
*/
- (void)getCertContCodeList:(void (^)(MResultBean *resultBean))resultBlock;


/**
 读取证书
 @param resultBlock 回调结果
 */
- (void)getCert:(void (^)(MResultBean *resultBean))resultBlock;


/**
 读取证书信息
 @param resultBlock 回调结果
 */
- (void)getCertInfo:(void (^)(MResultBean *resultBean))resultBlock;


/**
 读取证书OID信息
 @param strOid 证书OID标识
 @param resultBlock 回调结果
 */
- (void)getCertOidInfo:(NSString *)strOid resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 更新证书
 @param pin 验证的证书密码
 @param resultBlock 回调结果
 */
- (void)updateCert:(NSString *)pin resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 注销证书
 @param pin 验证的证书密码
 @param resultBlock 回调结果
 */
- (void)revokeCert:(NSString *)pin resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 数字签名
 @param signSrc 签名原文
 @param pin 验证的证书密码
 @param resultBlock 回调结果
 */
- (void)signature:(NSString *)signSrc pin:(NSString *)pin resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 验证签名
 @param signSrc 签名原文
 @param signData 签名值
 @param resultBlock 回调结果
 */
- (void)verifySignature:(NSString *)signSrc signData:(NSString *)signData resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 验证PIN
 @param pin 验证的证书密码
 @param resultBlock 回调结果
 */
- (void)verifyPin:(NSString *)pin resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 修改PIN
 @param oldPin 验证的证书密码
 @param newPin 新的的证书密码
 @param resultBlock 回调结果
 */
- (void)changePin:(NSString *)oldPin newPin:(NSString *)newPin resultBlock:(void (^)(MResultBean *resultBean))resultBlock;


/**
 解锁PIN
 @param adminPin 管理员密码
 @param newPin 重置的证书密码
 @param resultBlock 回调结果
 */
- (void)unlockPin:(NSString *)adminPin newPin:(NSString *)newPin resultBlocks:(void (^)(MResultBean *resultBean))resultBlock;


@end

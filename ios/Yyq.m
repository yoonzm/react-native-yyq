#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Yyq, NSObject)

/**
 * SDK初始化
 * @param url SDK地址
 * @param contCode 证书容器标识,用于区分多套证书,自定义
 *
 * @description 本接口用于初始化 SDK 地址。
 */
//initSDK(url: String, contCode: String): void;
RCT_EXTERN_METHOD(initSDK:(NSString)url withContCode:(NSString)contCode)

/**
 * 接口初始化
 * @param appId 机构对应应用ID(平台分配)
 * @param appCode 应用授权码,5.1.1.4中获取
 * @param userInfo 用户信息,详见4.1。
 *
 * @description 本接口用于初始化 MKEYAPI。
 * appCode 可在读取证书容器标识列表、读取证书、读取证书项、读取证书 OID 项、验 证签名、验证密码、修改密码等接口传空。 userInfo 可在读取证书容器标识列表接口传空。
 */
//initAPI(appId: String, appCode: String, userInfo: Partial<UserInfo>): void;
RCT_EXTERN_METHOD(initAPI:(NSString)appId
                  withAppCode:(NSString)appCode
                  withUserInfo:(NSString)userInfo)

/**
 * 申请证书
 * @param pin 证书密码
 */
//applyCert(pin: String): Promise<CommonResult<String>>;
RCT_EXTERN_METHOD(applyCert:(NSString)pin
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 更新证书
 * @param pin 证书密码
 */
//updateCert(pin: String): Promise<CommonResult<String>>;
RCT_EXTERN_METHOD(updateCert:(NSString)pin
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 注销证书
 * @param pin 证书密码
 */
//revokeCert(pin: String): Promise<CommonResult<String>>;
RCT_EXTERN_METHOD(revokeCert:(NSString)pin
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 读取证书容器标识列表
 *
 * @description 本 接 口 用 于 读 取 证 书 列 表 , 列 表 数 据 为 json 格 式 , 如 {"idNo1":["code1","code2"],"idNo2":["code1","code2"]}。
 */
//getCertContCodeList(): Promise<CommonResult<String>>;
RCT_EXTERN_METHOD(getCertContCodeList:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 读取证书
 *
 * @description 本接口用于读取证书,证书为 Base64 编码格式。
 */
//getCert(): Promise<CommonResult<String>>;
RCT_EXTERN_METHOD(getCert:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 读取证书项
 */
//getCertInfo(): Promise<CommonResult<CertInfo>>;
RCT_EXTERN_METHOD(getCertInfo:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 读取证书 OID 项
 *
 * @param strOid 证书oid标识
 */
//getCertInfoByOid(strOid: String): Promise<CommonResult>;
RCT_EXTERN_METHOD(getCertInfoByOid:(NSString)strOid
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 数字签名
 *
 * @param signSrc 签名原文,如需解Base64后签名,需在原文 Base64字符串增加“KSBASE64:”前缀
 * @param pin 证书密码
 *
 * @description 本接口用于对数据进行数字签名,签名值为 Base64 编码值。
 */
//signature(signSrc: String, pin: String): Promise<CommonResult<String>>;
RCT_EXTERN_METHOD(signature:(NSString)signSrc withPin:(NSString)pin
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 验证签名
 *
 * @param signSrc 签名原文
 * @param signData 签名值
 *
 * @description 本接口用于对签名值进行验证。
 */
//verifySignature(signSrc: String, signData: String): Promise<CommonResult>;
RCT_EXTERN_METHOD(verifySignature:(NSString)signSrc withSignData:(NSString)signData
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 验证密码
 *
 * @param pin 证书密码
 *
 * @description 本接口用于对签名值进行验证。
 */
//verifyPin(pin: String): Promise<CommonResult>;
RCT_EXTERN_METHOD(verifyPin:(NSString)pin
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 修改密码
 *
 * @param oldPin 证书密码
 * @param newPin 新的证书密码
 */
//modifyPin(oldPin: String, newPin: String): Promise<CommonResult>;
RCT_EXTERN_METHOD(modifyPin:(NSString)oldPin withNewPin:(NSString)newPin
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

/**
 * 解锁密码
 *
 * @param adminPin 管理员密码
 * @param newPin 新的证书密码
 */
//unlockPin(adminPin: String, newPin: String): Promise<CommonResult>;
RCT_EXTERN_METHOD(unlockPin:(NSString)adminPin withNewPin:(NSString)newPin
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end

//
//  MKeyMacro.h
//  MKeySdk
//
//  Created by lic&z on 2018/4/20.
//  Copyright © 2018年 lic&z. All rights reserved.
//

#ifndef MKeyMacro_h
#define MKeyMacro_h

#define ERR_OK                  0       // 成功
#define ERR_CANCEL              1       // 取消
#define ERR_PARAM               2       // 参数错误

#define ERR_NET                 10      // 网络错误
#define ERR_SUPPORT             11      // 暂不支持错误
#define ERR_EXCEPT              12      // 异常错误
#define ERR_USER_AUTH           13      // 用户认证错误
#define ERR_APP_AUTH            14      // 应用鉴权错误

#define ERR_CERT_APPLY          100     // 证书申请错误
#define ERR_CSR_MAKE            101     // 证书请求文件生成错误
#define ERR_KEY_GEN             102     // 密钥错误
#define ERR_CERT_SAVE           103     // 证书保存错误
#define ERR_CERT_GET            104     // 证书获取错误
#define ERR_CERT_INFO_GET       105     // 证书项获取错误
#define ERR_CERT_OID_GET        106     // 证书OID获取错误
#define ERR_CERT_DELETE         107     // 证书删除错误
#define ERR_CERT_UPDATE         108     // 证书更新错误
#define ERR_CERT_REVOKE         109     // 证书注销错误

#define ERR_PIN_VERIFY          200     // 密码验证错误
#define ERR_PIN_UNLOCK          210     // 密码解锁错误
#define ERR_PIN_CHANGE          211     // 密码更新错误
#define ERR_PIN_LOCK            212     // 密码锁死错误
#define ERR_PIN_EXCEPT          213     // 密码异常错误

#define ERR_SIGN                300     // 数字签名错误
#define ERR_SIGN_KEY            301     // 签名密钥错误
#define ERR_SIGN_VERIFY         302     // 验证签名错误


#endif /* MKeyMacro_h */

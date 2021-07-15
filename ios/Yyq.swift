@objc(Yyq)
class Yyq: NSObject {
    var mKeyApi: MKeyApi?;
    
    override init() {
    }
    
    func commonResponseHandle(resolve: RCTPromiseResolveBlock, result: MResultBean?) -> Void {
        resolve([
            "data": result?.data as Any,
            "code": result?.code as Any,
            "msg": result?.msg as Any
        ])
    }
    
    /**
     * SDK初始化
     * @param url SDK地址
     * @param contCode 证书容器标识,用于区分多套证书,自定义
     *
     * @description 本接口用于初始化 SDK 地址。
     */
    @objc(initSDK:withContCode:)
    func initSDK(url: String, contCode: String) -> Void {
        MKeyApi.initSDK(url, contCode: contCode)
    }

    /**
     * 接口初始化
     * @param appId 机构对应应用ID(平台分配)
     * @param appCode 应用授权码,5.1.1.4中获取
     * @param userInfo 用户信息,详见4.1。
     *
     * @description 本接口用于初始化 MKEYAPI。
     * appCode 可在读取证书容器标识列表、读取证书、读取证书项、读取证书 OID 项、验 证签名、验证密码、修改密码等接口传空。 userInfo 可在读取证书容器标识列表接口传空。
     */
    @objc(initAPI:withAppCode:withUserInfo:)
    func initAPI(appId: String, appCode: String, userInfo: String) -> Void {
        mKeyApi = MKeyApi.getInstance(appId, appCode: appCode, userInfo: userInfo);
    }

    /**
     * 申请证书
     * @param pin 证书密码
     */
    @objc(applyCert:withResolver:withRejecter:)
    func applyCert(pin: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.applyCert(pin) { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 更新证书
     * @param pin 证书密码
     */
    @objc(updateCert:withResolver:withRejecter:)
    func updateCert(pin: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.updateCert(pin) { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 注销证书
     * @param pin 证书密码
     */
    @objc(revokeCert:withResolver:withRejecter:)
    func revokeCert(pin: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.updateCert(pin) { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 读取证书容器标识列表
     *
     * @description 本 接 口 用 于 读 取 证 书 列 表 , 列 表 数 据 为 json 格 式 , 如 {"idNo1":["code1","code2"],"idNo2":["code1","code2"]}。
     */
    @objc(getCertContCodeList:withRejecter:)
    func getCertContCodeList(resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.getCertContCodeList() { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 读取证书
     *
     * @description 本接口用于读取证书,证书为 Base64 编码格式。
     */
    @objc(getCert:withRejecter:)
    func getCert(resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.getCert() { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 读取证书项
     */
    @objc(getCertInfo:withRejecter:)
    func getCertInfo(resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.getCertInfo() { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 读取证书 OID 项
     *
     * @param strOid 证书oid标识
     */
    @objc(getCertInfoByOid:withResolver:withRejecter:)
    func getCertInfoByOid(strOid: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.getCertOidInfo(strOid) { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 数字签名
     *
     * @param signSrc 签名原文,如需解Base64后签名,需在原文 Base64字符串增加“KSBASE64:”前缀
     * @param pin 证书密码
     *
     * @description 本接口用于对数据进行数字签名,签名值为 Base64 编码值。
     */
    @objc(signature:withPin:withResolver:withRejecter:)
    func signature(signSrc: String, pin: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.signature(signSrc, pin: pin) { (r) in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 验证签名
     *
     * @param signSrc 签名原文
     * @param signData 签名值
     *
     * @description 本接口用于对签名值进行验证。
     */
    @objc(verifySignature:withSignData:withResolver:withRejecter:)
    func verifySignature(signSrc: String, signData: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.verifySignature(signSrc, signData: signData) { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        }
    }

    /**
     * 验证密码
     *
     * @param pin 证书密码
     *
     * @description 本接口用于对签名值进行验证。
     */
    @objc(verifyPin:withResolver:withRejecter:)
    func verifyPin(pin: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.verifyPin(pin, resultBlock: { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        })
    }

    /**
     * 修改密码
     *
     * @param oldPin 证书密码
     * @param newPin 新的证书密码
     */
    @objc(modifyPin:withNewPin:withResolver:withRejecter:)
    func modifyPin(oldPin: String, newPin: String, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) -> Void {
        mKeyApi?.changePin(oldPin, newPin: newPin, resultBlock: { r in
            self.commonResponseHandle(resolve: resolve, result: r)
        })
    }

    /**
     * 解锁密码
     *
     * @param adminPin 管理员密码
     * @param newPin 新的证书密码
     */
    @objc(unlockPin:withNewPin:withResolver:withRejecter:)
    func unlockPin(adminPin: String, newPin: String, resolve:@escaping RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
        mKeyApi?.unlockPin(adminPin, newPin: newPin) { r in
            resolve(r)
        }
    }
}

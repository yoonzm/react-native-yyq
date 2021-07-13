package com.reactnativeyyq

import android.util.Base64
import com.custle.ksmkey.MKeyApi
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.reactnativeyyq.Utils.commonResponseHandle
import java.security.KeyFactory
import java.security.Signature
import java.security.spec.PKCS8EncodedKeySpec

class YyqModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
  private lateinit var mKeyApi: MKeyApi

  override fun getName(): String {
    return "Yyq"
  }

  /**
   * SDK初始化
   * @param url SDK地址
   * @param contCode 证书容器标识,用于区分多套证书,自定义
   *
   * @description 本接口用于初始化 SDK 地址。
   */
  @ReactMethod
  fun initSDK(url: String, contCode: String) {
    MKeyApi.initSDK(url, contCode)
  }

  /**
   * 接口初始化
   * @param appId 机构对应应用ID(平台分配)
   * @param appCode 应用授权码,5.1.1.4中获取 TODO
   * @param userInfo 用户信息,详见4.1。 TODO
   *
   * @description 本接口用于初始化 MKEYAPI。
   * appCode 可在读取证书容器标识列表、读取证书、读取证书项、读取证书 OID 项、验 证签名、验证密码、修改密码等接口传空。 userInfo 可在读取证书容器标识列表接口传空。
   */
  @ReactMethod
  fun initAPI(appId: String, appCode: String, userInfo: String) {
    mKeyApi = MKeyApi.getInstance(reactApplicationContext, appId, appCode, userInfo)
  }

  /**
   * 申请证书
   * @param pin 证书密码
   */
  @ReactMethod
  fun applyCert(pin: String, promise: Promise) {
    mKeyApi.applyCert(pin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 更新证书
   * @param pin 证书密码
   */
  @ReactMethod
  fun updateCert(pin: String, promise: Promise) {
    mKeyApi.updateCert(pin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 注销证书
   * @param pin 证书密码
   */
  @ReactMethod
  fun revokeCert(pin: String, promise: Promise) {
    mKeyApi.revokeCert(pin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 读取证书容器标识列表
   *
   * @description 本 接 口 用 于 读 取 证 书 列 表 , 列 表 数 据 为
   */
  @ReactMethod
  fun getCertContCodeList(promise: Promise) {
    mKeyApi.getCertContCodeList { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 读取证书
   *
   * @description 本接口用于读取证书,证书为 Base64 编码格式。
   */
  @ReactMethod
  fun getCert(promise: Promise) {
    mKeyApi.getCert { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 读取证书项
   */
  @ReactMethod
  fun getCertInfo(promise: Promise) {
    mKeyApi.getCertInfo { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 读取证书 OID 项
   *
   * @param strOid 证书oid标识
   */
  @ReactMethod
  fun getCertInfoByOid(strOid: String, promise: Promise) {
    mKeyApi.getCertInfoByOid(strOid) { r ->
      run {
        commonResponseHandle(promise, r)
      }
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
  @ReactMethod
  fun signature(signSrc: String, pin: String, promise: Promise) {
    mKeyApi.signature(signSrc, pin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
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
  @ReactMethod
  fun verifySignature(signSrc: String, signData: String, promise: Promise) {
    mKeyApi.verifySignature(signSrc, signData) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 验证密码
   *
   * @param pin 证书密码
   *
   * @description 本接口用于对签名值进行验证。
   */
  @ReactMethod
  fun verifyPin(pin: String, promise: Promise) {
    mKeyApi.verifyPin(pin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }


  /**
   * 修改密码
   *
   * @param oldPin 证书密码
   * @param newPin 新的证书密码
   */
  @ReactMethod
  fun modifyPin(oldPin: String, newPin: String, promise: Promise) {
    mKeyApi.modifyPin(oldPin, newPin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 解锁密码
   *
   * @param adminPin 管理员密码
   * @param newPin 新的证书密码
   */
  @ReactMethod
  fun unlockPin(adminPin: String, newPin: String, promise: Promise) {
    mKeyApi.unlockPin(adminPin, newPin) { r ->
      run {
        commonResponseHandle(promise, r)
      }
    }
  }

  /**
   * 获取应用授权签名
   *
   * @param privateKey
   * @param signData
   */
  @ReactMethod
  fun getServerSign(privateKey: String, signData: String, promise: Promise) {
    var result: String? = null
    try {
      val keySpec = PKCS8EncodedKeySpec(
        Base64.decode(privateKey, 1))
      val keyFactory = KeyFactory.getInstance("RSA")
      val priKey = keyFactory.generatePrivate(keySpec)
      val oSig = Signature.getInstance("SHA256WithRSA")
      oSig.initSign(priKey)
      oSig.update(signData.toByteArray())
      val signature = oSig.sign()
      if (signature != null && signature.isNotEmpty()) {
        result = String(Base64.encode(signature, 1))
      }
    } catch (e: Exception) {
      e.printStackTrace()
    }
    promise.resolve(result)
  }
}

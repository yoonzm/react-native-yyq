import * as React from 'react';

import { StyleSheet, View, ScrollView, Platform, Button } from 'react-native';
import Yyq from 'react-native-yyq';
import config from '../config.json';
import userinfo from '../userinfo.json';

export default function App() {
  console.log('default.App()', Yyq);

  const items = [
    {
      title: 'SDK初始化',
      onPress: () => {
        Yyq.initSDK(config.url, config.contCode);
      },
    },
    {
      title: '接口初始化',
      onPress: () => {
        Yyq.initAPI(config.appId, config.appCode, userinfo);
      },
    },
    {
      title: '申请证书',
      onPress: () => {
        Yyq.applyCert(config.pin).then(console.log);
      },
    },
    {
      title: '更新证书',
      onPress: () => {
        Yyq.updateCert(config.pin).then(console.log);
      },
    },
    {
      title: '注销证书',
      onPress: () => {
        Yyq.revokeCert(config.pin).then(console.log);
      },
    },
    {
      title: '读取证书容器标识列表',
      onPress: () => {
        Yyq.getCertContCodeList().then(console.log);
      },
    },
    {
      title: '读取证书',
      onPress: () => {
        Yyq.getCert().then(console.log);
      },
    },
    {
      title: '读取证书项',
      onPress: () => {
        Yyq.getCertInfo().then(console.log);
      },
    },
    {
      title: '读取证书 OID 项',
      onPress: () => {
        Yyq.getCertInfoByOid('').then(console.log);
      },
    },
    {
      title: '数字签名',
      onPress: () => {
        Yyq.signature('abcdefg', config.pin).then(console.log);
      },
    },
    {
      title: '验证签名',
      onPress: () => {
        Yyq.verifySignature(
          'abcdefg',
          'MEQCIFhNyX4Udn91MpdYEo1HV6bwPqsilWy68WUzMk7KJSrbAiBct8dKg/oojb6jbNRbL9KZYEQDM6IS/51nuh4eE6Y8kQ=='
        ).then(console.log);
      },
    },
    {
      title: '验证密码',
      onPress: () => {
        Yyq.verifyPin(config.pin).then(console.log);
      },
    },
    {
      title: '修改密码',
      onPress: () => {
        Yyq.modifyPin(config.pin, config.pin).then(console.log);
      },
    },
    {
      title: '解锁密码',
      onPress: () => {
        Yyq.unlockPin('666666', config.pin).then(console.log);
      },
    },
    {
      title: '获取应用授权签名',
      onPress: () => {
        Yyq.getServerSign(
          config.privateKey,
          `${config.businessCode}##${config.appId}##20210713161000`
        ).then(console.log);
      },
    },
  ];

  return (
    <View style={styles.container}>
      <ScrollView
        contentContainerStyle={{
          paddingTop: Platform.OS === 'ios' ? 20 : 0,
        }}
      >
        {items.map((item, index) => (
          <Button key={index} title={item.title} onPress={item.onPress} />
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

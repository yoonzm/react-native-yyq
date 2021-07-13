import { NativeModules } from 'react-native';
import type {
  CertInfo,
  CommonResult,
  UserInfo,
  YyqType,
  String,
} from './types';

export * from './types';

const { Yyq } = NativeModules;

export default {
  ...Yyq,
  initAPI(appId: String, appCode: String, userInfo: Partial<UserInfo>) {
    return Yyq.initAPI(appId, appCode, JSON.stringify(userInfo));
  },
  getCertInfo(): Promise<CommonResult<CertInfo>> {
    return Yyq.getCertInfo().then((res: CommonResult<String>) => ({
      ...res,
      data: JSON.parse(res.data),
    }));
  },
} as YyqType;

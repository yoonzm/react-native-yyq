import { NativeModules } from 'react-native';

type YyqType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Yyq } = NativeModules;

export default Yyq as YyqType;

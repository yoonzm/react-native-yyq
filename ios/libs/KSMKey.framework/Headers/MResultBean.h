//
//  MResultBean.h
//  KSMKey
//
//  Created by lic&z on 2018/5/18.
//  Copyright © 2018年 lic&z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MResultBean : NSObject

@property (assign, nonatomic) NSInteger code;
@property (strong, nonatomic) NSString *msg;
@property (strong, nonatomic) NSString *data;

@end

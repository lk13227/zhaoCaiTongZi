//
//  RegularTool.h
//  正则判断
//
//  Created by mac on 16-1-4.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularTool : NSObject
/*!
      *  匹配固定电话号码
      *
      *  @param number 需要匹配的固话号码
      *
      *  @return 返回匹配结果
      */
 + (BOOL)matchTelephoneNumber:(NSString *)number;

 /*!
      *  匹配手机号码
      *
      *  @param number 需要匹配的手机号码
      *
      *  @return 返回匹配结果
      */
 + (BOOL)matchMobilephoneNumber:(NSString *)number;

 /*!
      *  匹配3-15位的中文或英文(用户名)
      *
      *  @param username 需要匹配的字符串
      *
      *  @return 返回匹配结果
      */
 + (BOOL)matchUsername:(NSString *)username;

 /*!
      *  匹配6-18位的数字和字母组合(密码)
      *
      *  @param password 需要匹配的字符串
      *
      *  @return 返回匹配结果
      */
 + (BOOL)matchPassword:(NSString *)password;

 /*!
      *  匹配邮箱帐号
      *
      *  @param email 需要匹配的邮箱帐号
      *
      *  @return 返回匹配结果
      */
 + (BOOL)matchEmail:(NSString *)email;

 /*!
      *  匹配身份证号码
      *
      *  @param idCard 需要匹配的身份证号码
      *
      *  @return 返回匹配结果
      */
 + (BOOL)matchUserIdCard:(NSString *)idCard;

/**
 *  判断手机号
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

 @end

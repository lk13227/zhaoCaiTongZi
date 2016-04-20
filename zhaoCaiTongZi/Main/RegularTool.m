//
//  RegularTool.m
//  正则判断
//
//  Created by mac on 16-1-4.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import "RegularTool.h"

@implementation RegularTool
 #pragma mark - 匹配固定电话号码
 + (BOOL)matchTelephoneNumber:(NSString *)number {
         NSString *pattern = @"^(\\d{3,4}-)\\d{7,8}$";
         return [RegularTool matchString:number withPattern:pattern];
     }

 #pragma mark - 匹配手机号码
 + (BOOL)matchMobilephoneNumber:(NSString *)number {
         NSString *pattern = @"^(0|86)?1([358][0-9]|7[678]|4[57])\\d{8}$";
         return [RegularTool matchString:number withPattern:pattern];
     }

 #pragma mark - 匹配3-15位的中文或英文(用户名)
 + (BOOL)matchUsername:(NSString *)username {
         NSString *pattern = @"^[a-zA-Z一-龥]{3,15}$";
         return [RegularTool matchString:username withPattern:pattern];
     }

 #pragma mark - 匹配6-18位的数字和字母组合(密码)
 + (BOOL)matchPassword:(NSString *)password {
         NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}$";
         return [RegularTool matchString: password withPattern: pattern];
     }

 #pragma mark - 匹配邮箱帐号
 + (BOOL)matchEmail:(NSString *)email {
         NSString *pattern =
         @"^[a-z0-9]+([\\._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+\\.){1,63}[a-z0-9]+$";
         return [RegularTool matchString:email withPattern:pattern];
     }

 #pragma mark - 匹配身份证号码
 + (BOOL)matchUserIdCard:(NSString *)idCard {
         NSString *pattern =
         @"(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)";
         return [RegularTool matchString:idCard withPattern:pattern];
     }

 
 /*!
    80  *  正则匹配
    81  *
    82  *  @param str     匹配的字符串
    83  *  @param pattern 匹配规则
    84  *
    85  *  @return 返回匹配结果
    86  */
 + (BOOL)matchString:(NSString *)str withPattern:(NSString *)pattern {
         NSError *error = nil;
         NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern: pattern options: NSRegularExpressionCaseInsensitive error: &error];
         if (!error) {
                NSTextCheckingResult *result = [regular firstMatchInString:str options:0 range:NSMakeRange(0, str.length)];
                 if (result) {
//                         NSLog(@"匹配成功,Result: %@",[str substringWithRange:result.range]);
                         return YES;
                     }
             }
//         NSLog(@"匹配失败,Error: %@",error);
         return NO;
     }
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^[1][3-8]+\\d{9}";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end

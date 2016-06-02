//
//  AppDelegate.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/5.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "AppDelegate.h"

#import "CoreNewFeatureVC.h"//启动页三方库

#import <AlipaySDK/AlipaySDK.h>

#import "LKTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window = window;
    
    //判断是否需要显示：（内部已经考虑版本及本地版本缓存）
    BOOL canShow = [CoreNewFeatureVC canShowNewFeature];
    
    //测试代码，正式版本应该删除
    //canShow = YES;
    
    if(canShow){
        
        NewFeatureModel *m1 = [NewFeatureModel model:[UIImage imageNamed:@"1.jpg"]];
        
        NewFeatureModel *m2 = [NewFeatureModel model:[UIImage imageNamed:@"2.jpg"]];
        
        NewFeatureModel *m3 = [NewFeatureModel model:[UIImage imageNamed:@"3.jpg"]];
        
        window.rootViewController = [CoreNewFeatureVC newFeatureVCWithModels:@[m1,m2,m3] enterBlock:^{
            
            [self enter];
        }];
    }else{
        
        [self enter];
    }
    
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)enter
{
    //设置窗口的跟控制器
    UITabBarController *tabBarController = [[LKTabBarController alloc] init];
    
    self.window.rootViewController = tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  监听其他应用跳转过来的方法
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    //支付宝
    if ([url.host containsString:@"safepay"]) {
        
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            LKLog(@"支付结果 result = %@",resultDic);
        }];
    }
    
    
    return YES;
}

@end

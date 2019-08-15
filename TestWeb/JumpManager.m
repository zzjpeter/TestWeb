//
//  JumpManager.m
//  TooToo
//
//  Created by liuning on 15/12/25.
//  Copyright © 2015年 MoHao. All rights reserved.
//

#import "JumpManager.h"
#import "TestViewController.h"

@implementation VMControllerHelper

#pragma mark -获取当前VC
/////////////////////////////////////////////////
//获取当前Controller
+ (UIViewController *)currentViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UINavigationController *)currentNavigationController
{
    UIViewController * vc = [self currentViewController];
    if (vc.navigationController) {
        
        return vc.navigationController;
    }
    
    return nil;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}
/////////////////////////////////////////////////

@end

@interface JumpManager ()

@end

@interface JumpManager ()
@end

@implementation JumpManager

+(instancetype)sharedManager
{
    static dispatch_once_t queue;
    static JumpManager * manager = nil;
    
    dispatch_once(&queue, ^{
        manager = [[JumpManager alloc]init];
    });
    
    return manager;
}

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark -通用push 和 present

-(void)doPushViewController:(UIViewController *)viewController
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[VMControllerHelper currentNavigationController] pushViewController:viewController animated:YES];
    });
}

-(void)doPresentViewController:(UIViewController *)viewController
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[VMControllerHelper currentViewController] presentViewController:viewController animated:YES completion:^{
            
        }];
    });
}

#pragma mark -跳转协议

- (void)jumpToVC
{
    TestViewController *vc = [TestViewController new];
    [self doPushViewController:vc];
}
@end

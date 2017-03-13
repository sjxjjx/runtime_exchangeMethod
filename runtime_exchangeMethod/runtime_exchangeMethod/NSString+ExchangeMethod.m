//
//  NSString+ExchangeMethod.m
//  runtime_exchangeMethod
//
//  Created by sjx on 2017/3/13.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "NSString+ExchangeMethod.h"
#import <objc/runtime.h>

@implementation NSString (ExchangeMethod)

+ (void)load
{
    // 获取系统的对象方法
    Method stringByAppendingStringMethod = class_getInstanceMethod(self, @selector(stringByAppendingString:));
    
    // 获取自己定义的对象方法
    Method sjx_stringByAppendingStringMethod = class_getInstanceMethod(self, @selector(sjx_stringByAppendingString:));
    
    // 方法交换
    method_exchangeImplementations(stringByAppendingStringMethod, sjx_stringByAppendingStringMethod);
}

- (NSString *)sjx_stringByAppendingString:(NSString *)aString
{
    if (aString == nil || aString.length == 0) {
        aString = @"输入的字符串为空哦！！";
    }
    
    /*
     因为已经交换了方法，所以在这里调用 sjx_stringByAppendingString: 实际为 stringByAppendingString: 
     如果这里写 stringByAppendingString: 会造成死循环
     */
    return [self sjx_stringByAppendingString:aString];
}

@end

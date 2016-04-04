//
//  QCTopic.m
//  QCTabbarController
//
//  Created by 程庆春 on 16/4/1.
//  Copyright © 2016年 QC Inc. All rights reserved.
//

#import "QCTopic.h"
#import "NSDate+QC.h"

@implementation QCTopic

- (NSString *)passtime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *createTime = [formatter dateFromString:_passtime];
    
    if ([createTime isThisYear]) { // 今年
        if ([createTime isToday]) { // 今天
            NSDateComponents *comp = [[NSDate date] deltaFrom:createTime];
            if (comp.hour >= 1) { // 几小时
                return [NSString stringWithFormat:@"%zd小时前",comp.hour];
            } else if (comp.minute >= 1) { // 几分钟前
                return [NSString stringWithFormat:@"%zd分钟前",comp.minute];
            } else { // 几秒前----> 刚刚
                return [NSString stringWithFormat:@"刚刚"];
            }
        } else if([createTime isYesterday]) { // 昨天
            formatter.dateFormat = @"昨天HH:mm:ss";
            return [formatter stringFromDate:createTime];
        } else {
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            return [formatter stringFromDate:createTime];
        }
    } else { // 非今年
        return _passtime;
    }
    
    
}

@end

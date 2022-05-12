//
//  Task.h
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject<NSCoding>

@property NSString *title, *tDescription;
@property int priority, tid, state;
@property NSDate *date;
@end

NS_ASSUME_NONNULL_END

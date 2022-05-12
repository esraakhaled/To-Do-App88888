//
//  AddTask.h
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AddTask <NSObject>
-(void)addTask : (Task*) task;
@end

NS_ASSUME_NONNULL_END


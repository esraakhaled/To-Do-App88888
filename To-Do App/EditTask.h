//
//  EditTask.h
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EditTask <NSObject>
-(void)editTask : (Task*) task :(int) position;
//-(void)editTask : (Task*) task OldTask:(Task*) task2 :(int) position;

@end

NS_ASSUME_NONNULL_END

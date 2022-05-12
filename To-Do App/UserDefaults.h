//
//  UserDefaults.h
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaults : NSObject{
    NSMutableArray<Task*> *tasksArray;
    NSUserDefaults *defaults;
}
-(NSMutableArray*)loadArrays;
-(void)saveArray:(NSMutableArray*) tasks;
@end

NS_ASSUME_NONNULL_END

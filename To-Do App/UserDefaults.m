//
//  UserDefaults.m
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import "UserDefaults.h"

@implementation UserDefaults

- (instancetype)init
{
    self = [super init];
    if (self) {
        defaults = [NSUserDefaults standardUserDefaults];
        NSData *readData = [defaults objectForKey:@"tasksArray"];
        tasksArray = [NSKeyedUnarchiver unarchiveObjectWithData:readData];
       if ([tasksArray count]==0) {
            tasksArray = [NSMutableArray new];
        }

    }
    return self;
}

- (NSMutableArray *)loadArrays{
    return tasksArray;
}

- (void)saveArray:(NSMutableArray *)tasks{
    tasksArray = tasks;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tasksArray];
    [defaults setObject:data forKey:@"tasksArray"];
    [defaults synchronize];
}
@end

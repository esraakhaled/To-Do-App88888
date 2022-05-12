//
//  TodoTableViewController.h
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import <UIKit/UIKit.h>
#import "AddTask.h"
#import "EditTask.h"
#import <UserNotifications/UserNotifications.h>
NS_ASSUME_NONNULL_BEGIN

@interface TodoTableViewController : UITableViewController <EditTask,AddTask,UISearchBarDelegate>

@end

NS_ASSUME_NONNULL_END

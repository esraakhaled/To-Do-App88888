//
//  InProgressTableViewController.h
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import <UIKit/UIKit.h>
#import "EditTask.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgressTableViewController : UITableViewController <EditTask,UISearchBarDelegate, UITabBarControllerDelegate>

@end

NS_ASSUME_NONNULL_END

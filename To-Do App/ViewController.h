//
//  ViewController.h
//  To-Do App
//
//  Created by Esraa Khaled   on 11/05/2022.
//

#import <UIKit/UIKit.h>
#import "AddTask.h"
@interface ViewController : UIViewController<UITextFieldDelegate>

@property id <AddTask> addTaskProtocol;
@property int tid;

@end

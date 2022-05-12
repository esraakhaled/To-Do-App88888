//
//  ViewController.m
//  To-Do App
//
//  Created by Esraa Khaled   on 11/05/2022.
//

#import "ViewController.h"
#import "Task.h"
@interface ViewController (){
    Task *task;
}
@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    task = [Task new];
    _txtTitle.delegate = self;
    _txtDescription.delegate = self;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addTask:(id)sender {
    task.title = _txtTitle.text;
    task.tDescription = _txtDescription.text;
    task.tid = _tid;
    NSInteger *nsintPriority = _priority.selectedSegmentIndex;
    int intPriority = (int)nsintPriority;
    switch (intPriority) {
        case 0:
            task.priority = 0;
            break;
        case 1:
            task.priority = 1;
            break;
        case 2:
            task.priority = 2;
            break;
        default:
            task.priority = 1;
        break;
    }
    task.date = _datePicker.date;
    [_addTaskProtocol addTask:task];
    [self.navigationController popViewControllerAnimated:YES];
}


@end

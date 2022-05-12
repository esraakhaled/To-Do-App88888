//
//  EditViewController.m
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priority;
@property (weak, nonatomic) IBOutlet UISegmentedControl *state;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtTitle.text = _task.title;
    _txtDescription.text = _task.tDescription;
//    NSInteger *intPriority = _task.priority;
    [_priority setSelectedSegmentIndex:_task.priority];
//    NSInteger *intState = _task.state;
    [_state setSelectedSegmentIndex:_task.state];
    if (_task.state==1) {
        [_state setEnabled:NO forSegmentAtIndex:0];
    }else if (_task.state==2){
        [_state setEnabled:NO forSegmentAtIndex:0];
        [_state setEnabled:NO forSegmentAtIndex:1];
    }
}

- (IBAction)btnEdit:(id)sender {
    _txtTitle.enabled = YES;
    _txtTitle.textColor = [UIColor blackColor];
    _txtDescription.textColor = [UIColor blackColor];
    _txtDescription.editable = YES;
    _priority.enabled = YES;
    _datePicker.enabled = YES;
}

- (IBAction)btnDone:(id)sender {
    _task.title = _txtTitle.text;
    _task.tDescription = _txtDescription.text;
    NSInteger *nsintPriority = _priority.selectedSegmentIndex;
    int intPriority = (int) nsintPriority;
    switch (intPriority) {
        case 0:
            _task.priority = 0;
            break;
        case 1:
            _task.priority = 1;
            break;
        case 2:
            _task.priority = 2;
            break;
        default:
            _task.priority = 1;
        break;
    }
    
    NSInteger *nsintState = _state.selectedSegmentIndex;
    int intState = (int) nsintState;
    switch (intState) {
        case 0:
            _task.state = 0;
            break;
        case 1:
            _task.state = 1;
            break;
        case 2:
            _task.state = 2;
            break;
        default:
            _task.state = 0;
        break;
    }
    
    [_editTaskProtocol editTask:_task :_objectNumber];
//    [_editTaskProtocol editTask:_task OldTask:_oldTask :_objectNumber];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  DoneTableTableViewController.m
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import "DoneTableTableViewController.h"
#import "EditViewController.h"
#import "UserDefaults.h"

@interface DoneTableTableViewController (){
    NSMutableArray<Task*> *tasksArray;
    NSMutableArray<Task*> *tasksDoneArray;
    NSMutableArray<Task*> *tasksHighArray;
    NSMutableArray<Task*> *tasksMediumArray;
    NSMutableArray<Task*> *tasksLowArray;
    UserDefaults* userDef;
    BOOL isFiltered;
    BOOL isSorted;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation DoneTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    userDef = [UserDefaults new];
    isFiltered = false;
    isSorted = false;
    _searchBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated{
    [self loadArrays];
    [self updateArray];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length==0) {
        isFiltered = false;
        [self updateArray];
    }else{
        isFiltered = true;
        printf("search method");
        [tasksDoneArray removeAllObjects];
        for (int i =0; i<[tasksArray count]; i++) {
            Task *myTask = [tasksArray objectAtIndex:i];
            NSRange nameRange = [myTask.title rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (nameRange.location != NSNotFound) {
                [tasksDoneArray addObject:myTask];
            }
        }
        [self.tableView reloadData];
    }
}

-(void)loadArrays{
    tasksArray = [userDef loadArrays];
    tasksDoneArray = [NSMutableArray new];
   if ([tasksArray count]==0) {
        tasksArray = [NSMutableArray new];
    }
}

-(void)saveData{
    [userDef saveArray:tasksArray];
}

-(void)updateArray{
    tasksDoneArray = [NSMutableArray new];
    for (int i = 0; i < [tasksArray count]; i++) {
        if ([[tasksArray objectAtIndex:i] state]==2) {
            [tasksDoneArray addObject:[tasksArray objectAtIndex:i]];
        }
    }
    [self.tableView reloadData];
}

- (IBAction)sortToggle:(id)sender {
    isSorted = !isSorted;
    tasksHighArray = [NSMutableArray new];
    tasksMediumArray = [NSMutableArray new];
    tasksLowArray = [NSMutableArray new];

    for (int i = 0; i < [tasksDoneArray count]; i++) {
        if ([[tasksArray objectAtIndex:i] priority]==0) {
            [tasksLowArray addObject:[tasksDoneArray objectAtIndex:i]];
        }else if([[tasksArray objectAtIndex:i] priority]==1){
            [tasksMediumArray addObject:[tasksDoneArray objectAtIndex:i]];
        }else if([[tasksArray objectAtIndex:i] priority]==2){
            [tasksHighArray addObject:[tasksDoneArray objectAtIndex:i]];
        }
        printf("task %d %d\n",i,[[tasksDoneArray objectAtIndex:i] priority]);
    }
    printf("counts %d %d %d\n",[tasksHighArray count],[tasksMediumArray count], [tasksLowArray count]);
    [self.tableView reloadData];
}


- (void)editTask:(Task *)task :(int)position{
    [self loadArrays];
    for (int i = 0; i<[tasksArray count]; i++) {
        if (position == [tasksArray objectAtIndex:i].tid){
            [tasksArray replaceObjectAtIndex:i withObject:task];
        }
    }
    printf("all array count %d\n",[tasksArray count]);
    [self updateArray];
    [self saveData];
}


#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionName;
    if (isSorted) {
        switch (section) {
            case 0:
                sectionName = @"High";
                break;
            case 1:
                sectionName = @"Medium";
                break;
            case 2:
                sectionName = @"Low";
                break;
            default:
                break;
        }
    }
    return sectionName;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (isSorted) {
        return 3;
    }
    return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isSorted) {
        switch (section) {
            case 0:
                return [tasksHighArray count];
                break;
            case 1:
                return [tasksMediumArray count];
                break;
            case 2:
                return [tasksLowArray count];
                break;
            default:
                break;
        }
    }
    return [tasksDoneArray count];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Task *task = [tasksDoneArray objectAtIndex:indexPath.row];
        [tasksArray removeObject:task];
        [tasksDoneArray removeObjectAtIndex:indexPath.row];
        [self saveData];
        [tableView reloadData]; // tell table to refresh now
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
    
    Task *task ;
    if (isSorted) {
        switch (indexPath.section) {
            case 0:
                if (tasksHighArray.count>0) {
                    task = [tasksHighArray objectAtIndex:indexPath.row];
                }
                break;
            case 1:
                if (tasksMediumArray.count>0) {
                    task = [tasksMediumArray objectAtIndex:indexPath.row];
                }
                break;
            case 2:
                if (tasksLowArray.count>0) {
                    task = [tasksLowArray objectAtIndex:indexPath.row];
                }
                break;
            default:
                break;
        }
    }else{
        task = [tasksDoneArray objectAtIndex:indexPath.row];
    }
    
    
    IBOutlet UILabel *taskTitle = [cell viewWithTag:7];
    taskTitle.text = task.title;
    IBOutlet UILabel *taskPriority = [cell viewWithTag:8];
    UIView *priorityCircle = [cell viewWithTag:9];
    switch (task.priority) {
        case 0:
            taskPriority.text = @"L";
            priorityCircle.backgroundColor = [UIColor yellowColor];
            break;
        case 1:
            taskPriority.text = @"M";
            priorityCircle.backgroundColor = [UIColor orangeColor];
            break;
        case 2:
            taskPriority.text = @"H";
            priorityCircle.backgroundColor = [UIColor redColor];
            break;
        default:
            break;
    }
    priorityCircle.layer.cornerRadius = 15;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditViewController *editScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
    Task *editTask = [tasksDoneArray objectAtIndex:indexPath.row];
    editScreen.task = editTask;
    editScreen.objectNumber = editTask.tid;
    editScreen.editTaskProtocol = self;
    printf("all array count %d task no %d\n",[tasksArray count],editTask.tid);
    [self.navigationController pushViewController:editScreen animated:YES];
}


@end

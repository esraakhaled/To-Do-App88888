//
//  AppDelegate.h
//  To-Do App
//
//  Created by Esraa Khaled   on 11/05/2022.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


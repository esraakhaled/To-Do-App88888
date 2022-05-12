//
//  Task.m
//  To-Do App
//
//  Created by Esraa Khaled   on 12/05/2022.
//

#import "Task.h"

@implementation Task

@synthesize title, tDescription, state, priority, tid, date;

- (id)initWithCoder:(NSCoder *)coder{
//    self = [super init];
//    if (self != nil)
    if(self = [super init])
    {
        self.title = [coder decodeObjectForKey:@"title"];
        self.tDescription = [coder decodeObjectForKey:@"tDescription"];
        self.state = [coder decodeIntForKey:@"state"];
        self.priority = [coder decodeIntForKey:@"priority"];
        self.tid = [coder decodeIntForKey:@"tid"];
        self.date = [coder decodeObjectForKey:@"date"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder{
//    [super encodeWithCoder:coder];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.tDescription forKey:@"tDescription"];
    [coder encodeInt:state forKey:@"state"];
    [coder encodeInt:priority forKey:@"priority"];
    [coder encodeInt:tid forKey:@"tid"];
    [coder encodeObject:self.date forKey:@"date"];
}

@end

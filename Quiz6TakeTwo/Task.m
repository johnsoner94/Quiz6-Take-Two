//
//  Task.m
//  Quiz5FromStoryBoard
//
//  Created by Michael Toth on 3/17/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "Task.h"

@implementation Task

- (id) init
{
    // default settings
    self = [super init];
    
    if (self)
    {
        _taskName = @"New Task";
        _dueDate = [NSDate date];
        _urgency = 0.5;
    }
    return self;
}

@end

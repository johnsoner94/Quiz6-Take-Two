//
//  Task.h
//  Quiz5FromStoryBoard
//
//  Created by Michael Toth on 3/17/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic) float urgency;
@property (nonatomic,retain) NSString *taskName;
@property (nonatomic, retain) NSDate *dueDate;
@end

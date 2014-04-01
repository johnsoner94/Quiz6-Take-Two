//
//  Q6DetailViewController.h
//  Quiz6TakeTwo
//
//  Created by Emily Johnson on 3/31/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface Q6DetailViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) Task *task;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, copy) void (^dismissBlock)(void);
@end

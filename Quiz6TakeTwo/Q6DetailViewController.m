//
//  Q6DetailViewController.m
//  Quiz6TakeTwo
//
//  Created by Emily Johnson on 3/31/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "Q6DetailViewController.h"

@interface Q6DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (weak, nonatomic) IBOutlet UISlider *urgencySlider;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)urgencyValueChanged:(id)sender;
- (IBAction)saved:(id)sender;
- (void)configureView;
@end

@implementation Q6DetailViewController
@synthesize dismissBlock;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (IBAction)urgencyValueChanged:(id)sender
{
    UISlider *s = sender;
    [self.urgencyLabel setText: [NSString stringWithFormat:@"Urgency: %.2f", s.value]];
}

- (IBAction)saved:(id)sender
{
    if ([self.urgencySlider value]<6) {
        [self.detailDescriptionLabel setTextColor:[UIColor greenColor]];
    }
    else
    {
        [self.detailDescriptionLabel setTextColor:[UIColor redColor]];
    }
    [self.task setTaskName:[self.taskName text]];
    [self.task setUrgency:[self.urgencySlider value]];
    [self.task setDueDate:[self.datePicker date]];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:dismissBlock];
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set the text field as the delegate
    self.taskName.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

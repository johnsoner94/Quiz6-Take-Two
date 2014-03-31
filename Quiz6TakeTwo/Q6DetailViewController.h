//
//  Q6DetailViewController.h
//  Quiz6TakeTwo
//
//  Created by Emily Johnson on 3/31/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Q6DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

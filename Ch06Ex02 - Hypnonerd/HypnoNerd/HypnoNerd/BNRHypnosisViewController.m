//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";

        // Create a UIImage from a file
        // This will use Hypno@2x on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];

        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }

    return self;
}

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];

    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];

    NSLog(@"BNRHypnosisViewController loaded its view");
    
    NSArray *colors = @[@"red", @"green", @"blue"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:colors];
    segmentedControl.frame = CGRectMake(0, 100, UIScreen.mainScreen.bounds.size.width, 44);
    segmentedControl.backgroundColor = UIColor.whiteColor;
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
}

- (void)segmentAction:(UISegmentedControl *)seg
{
    NSInteger i = seg.selectedSegmentIndex;
    BNRHypnosisView *backgroundView = (BNRHypnosisView *)self.view;
    switch (i) {
        case 0:
            [backgroundView setCircleColor:UIColor.redColor];
            break;
        case 1:
            [backgroundView setCircleColor:UIColor.greenColor];
            break;
        case 2:
            [backgroundView setCircleColor:UIColor.blueColor];
            break;
            
        default:
            break;
    }
    
}

@end

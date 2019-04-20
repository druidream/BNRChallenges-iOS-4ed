//
//  BNRDatePickerViewController.m
//  HomePwner
//
//  Created by Gu Jun on 2019/4/20.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

#import "BNRDatePickerViewController.h"
#import "BNRItem.h"

@interface BNRDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(chooseDate)];
    self.navigationItem.rightBarButtonItem = bbi;
}

- (void)chooseDate
{
    [self.item setDateCreated:self.datePicker.date];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

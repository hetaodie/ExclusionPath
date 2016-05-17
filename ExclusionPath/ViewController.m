//
//  ViewController.m
//  ExclusionPath
//
//  Created by Weixu on 16/5/16.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ViewController.h"
#import "ExclusionPathVC.h"
#import "PageViewController.h"
#import "SimplePageVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnPress:(id)sender {
    
    ExclusionPathVC *exclusionPathVC = [[ExclusionPathVC alloc] initWithNibName:@"ExclusionPathVC" bundle:nil];
    [self presentViewController:exclusionPathVC animated:YES completion:nil];
}

- (IBAction)pageButtonPress:(id)sender {
    
    PageViewController *pageViewController = [[PageViewController alloc] initWithNibName:@"PageViewController" bundle:nil];
    
    [self presentViewController:pageViewController animated:YES completion:nil];
}

- (IBAction)simolePageButtonPress:(id)sender {
    
    SimplePageVC *simplePageVC = [[SimplePageVC alloc] init];
    [self presentViewController:simplePageVC animated:YES completion:nil];
    
}


@end

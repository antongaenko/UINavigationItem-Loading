//
//  ViewController.m
//  NavigationBarLoadingDemo
//
//  Created by Anton Gaenko on 09.01.15.
//  Copyright (c) 2015 Anton Gaenko. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationItem+Loading.h"


@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation ViewController

#pragma mark Controller life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildColorPalette];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self runForFirstTime];
}

#pragma mark UI logic
- (void)runForFirstTime {
    [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionCenter];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationItem stopAnimating];
        
        [UIView animateWithDuration:0.25f animations:^{
            for (UIButton* b in self.buttons) b.alpha = 1.0f;
        }];
    });
}

- (void)buildColorPalette {
    NSArray* colors = @[
                        self.view.tintColor,
                        [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f],
                        [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f],
                        [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f],
                        [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f],
                        [UIColor colorWithRed:1.0f green:0.17f blue:0.34f alpha:1.0f]
                        ];
    
    [colors enumerateObjectsUsingBlock:^(UIColor* c, NSUInteger idx, BOOL *stop) {
        UIButton* b = [self buttonWithColor:c];
        CGFloat size = CGRectGetWidth(self.view.frame) / colors.count;
        b.frame = CGRectOffset(CGRectMake(0, 0, size, size), size * idx, 0);
        [self.view addSubview:b];
    }];
}

- (UIButton*)buttonWithColor:(UIColor*)color {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = color;
    [btn addTarget:self action:@selector(pickColor:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark Actions
- (void)pickColor:(UIButton*)sender {
    [UIActivityIndicatorView appearanceWhenContainedIn:[UINavigationBar class], nil].color = [sender backgroundColor];
    [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionCenter];
}

- (IBAction)didStartLeft:(id)sender {
    [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionLeft];
}

- (IBAction)didStartCenter:(id)sender {
    [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionCenter];
}

- (IBAction)didStartRight:(id)sender {
    [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionRight];
}

- (IBAction)didStop:(id)sender {
    [self.navigationItem stopAnimating];
}

@end

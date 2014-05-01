//
//  KZViewController.m
//  BlockBreaker
//
//  Created by Kai Zou on 2014-04-30.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

#import "KZViewController.h"

@interface KZViewController ()

@end

@implementation KZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.gameModel = [[KZBlockerModel alloc] init];
    
    for (KZBlockView* bv in self.gameModel.blocks) {
        [self.view addSubview:bv];
    }
    
    self.paddle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paddle.png"]];
    
    [self.paddle setFrame:self.gameModel.paddleRect];
    
    [self.view addSubview:self.paddle];
    
    self.ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [self.ball setFrame:self.gameModel.ballRect];
    [self.view addSubview:self.ball];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

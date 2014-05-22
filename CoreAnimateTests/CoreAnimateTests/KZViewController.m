//
//  KZViewController.m
//  CoreAnimateTests
//
//  Created by Kai Zou on 2014-05-01.
//  Copyright (c) 2014 com.personal. All rights reserved.
//

//NOTE: CALayer animatable properties are automatically animated when they are changed!

#import "KZViewController.h"

@interface KZViewController ()

@end

@implementation KZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handletap:)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    UIImage *bg = [UIImage imageNamed:@"Background.png"];
    self.view.layer.contents = (id)[bg CGImage];
    
    alternate = YES;
    
    [self addShipLayers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addShipLayers {
    UIImage *shipImage = [UIImage imageNamed:@"SpaceShip_1.png"];
    ship1 = [[CALayer alloc] init];
    ship1.frame = CGRectMake(0, 0, SHIP1_WIDTH, SHIP1_HEIGHT);
    ship1.contents = (id)[shipImage CGImage];
    
    shipImage = [UIImage imageNamed:@"SpaceShip_2.png"];
    ship2 = [[CALayer alloc] init];
    ship2.frame = CGRectMake(0, 150, SHIP2_WIDTH, SHIP2_HEIGHT);
    ship2.contents = (id)[shipImage CGImage];
    
    shipImage = [UIImage imageNamed:@"SpaceShip_3.png"];
    ship3 = [[CALayer alloc] init];
    ship3.frame = CGRectMake(0, 300, SHIP3_WIDTH, SHIP3_HEIGHT);
    ship3.contents = (id)[shipImage CGImage];
    
    [self.view.layer addSublayer:ship1];
    [self.view.layer addSublayer:ship2];
    [self.view.layer addSublayer:ship3];
}

-(void)handletap:(UIGestureRecognizer *)gestureRecognizer {
    if (alternate) {
        ship1.frame = CGRectMake(0, 0, 0, 0);
        ship2.frame = CGRectMake(0, 0, 0, 0);
        ship3.frame = CGRectMake(0, 0, 0, 0);
    } else {
        [self returnShipsToDefaultState];
    }
    alternate = !alternate;
}

-(void)returnShipsToDefaultState {
    ship1.frame = CGRectMake(0, 0, SHIP1_WIDTH, SHIP1_HEIGHT);
    ship2.frame = CGRectMake(0, 150, SHIP2_WIDTH, SHIP2_HEIGHT);
    ship3.frame = CGRectMake(0, 300, SHIP3_WIDTH, SHIP3_HEIGHT);
}

@end

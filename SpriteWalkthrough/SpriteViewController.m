//
//  SpriteViewController.m
//  SpriteWalkthrough
//
//  Created by liuxin on 14-7-10.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//

#import "SpriteViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "HelloScene.h"

@interface SpriteViewController ()

@end

@implementation SpriteViewController

- (void)viewWillAppear:(BOOL)animated
{
    HelloScene* hello = [[HelloScene alloc]initWithSize:CGSizeMake(768, 1024)];
    SKView *spriteView = (SKView *)self.view;
    [spriteView presentScene: hello];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	SKView *spriteView = (SKView *)self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

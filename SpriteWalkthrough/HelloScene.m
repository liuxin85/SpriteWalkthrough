//
//  HelloScene.m
//  SpriteWalkthrough
//
//  Created by liuxin on 14-7-10.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//

#import "HelloScene.h"
#import "SpaceshipScene.h"

@interface HelloScene()
@property BOOL contentCreated;

@end

@implementation HelloScene
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKNode *helloNode = [self childNodeWithName:@"helloNode"];
    if (helloNode != nil) {
        helloNode.name = nil;
        SKAction *moveUp = [SKAction moveByX:0 y:100.0 duration:0.5];
        SKAction *zoom = [SKAction scaleTo: 2.0 duration:0.25];
        SKAction *pause = [SKAction waitForDuration: 0.5];
        SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
        SKAction *remove = [SKAction removeFromParent];
        
        SKAction *moveSequence = [SKAction sequence:@[moveUp, zoom,pause,fadeAway,remove]];
        [helloNode runAction: moveSequence completion:^{
            SKScene *spaceshipScene = [[SpaceshipScene alloc]initWithSize: self.size];
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration: 0.5];
            [self.view presentScene: spaceshipScene transition: doors];
        }];
    }
}


- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}
- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self newHelloNode]];
}
- (SKLabelNode *)newHelloNode
{
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text = @"Hello, World!";
    helloNode.fontSize = 42;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    helloNode.name = @"helloNode";
    
    return helloNode;
}
@end

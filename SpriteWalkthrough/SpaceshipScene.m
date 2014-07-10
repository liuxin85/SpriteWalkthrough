//
//  SpaceshipScene.m
//  SpriteWalkthrough
//
//  Created by liuxin on 14-7-10.
//  Copyright (c) 2014年 liu xin. All rights reserved.
//

#import "SpaceshipScene.h"

@interface SpaceshipScene ()
@property BOOL contentCreated;

@end

@implementation SpaceshipScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}
- (void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *spaceship = [self newSpaceship];
    spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-150);
    [self addChild: spaceship];
    SKAction *makeRocks = [SKAction sequence:@[
                                               [SKAction performSelector:@selector(addRock) onTarget:self],
                                               [SKAction waitForDuration:0.10 withRange:0.15]]];
    [self runAction:[SKAction repeatActionForever: makeRocks]];
    
}
static inline CGFloat skRandf(){
    return rand() / (CGFloat)RAND_MAX;
    
}
static inline CGFloat skRand(CGFloat low, CGFloat high){
    return skRandf() * (high - low) + low;
}
- (void)addRock
{
    SKSpriteNode *rock = [[SKSpriteNode alloc]initWithColor:[SKColor brownColor] size:CGSizeMake(8, 8)];
    rock.position = CGPointMake(skRand(0, self.size.width), self.size.height - 50);
    rock.name = @"rock";
    rock.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rock.size];
    rock.physicsBody.usesPreciseCollisionDetection = YES;
    [self addChild: rock];
}
- (SKSpriteNode *)newSpaceship
{
    SKSpriteNode *hull = [[SKSpriteNode alloc]initWithColor:[SKColor grayColor] size:CGSizeMake(64, 32)];
    hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: hull.size];
    hull.physicsBody.dynamic = NO;
    SKSpriteNode *light1 = [self newLight];
    light1.position = CGPointMake(-28.0, 6.0);
    [hull addChild: light1];
    SKSpriteNode *light2 = [self newLight];
    light2.position = CGPointMake(28.0, 6.0);
    [hull addChild: light2];
    
    SKAction *hover = [SKAction sequence:@[
                                           [SKAction waitForDuration: 1.0],
                                           [SKAction moveByX:100 y:50.0 duration:1.0],
                                           [SKAction waitForDuration:1.0],
                                           [SKAction moveByX:-100.0 y:-50 duration:1.0]]];
    [hull runAction:[SKAction repeatActionForever: hover]];
    return hull;
}
- (SKSpriteNode *)newLight
{
    SKSpriteNode *light = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(8, 8)];
    SKAction *blink = [SKAction sequence:@[
                                           [SKAction fadeOutWithDuration:0.25],
                                           [SKAction fadeInWithDuration:0.25]]];
    SKAction *blinkForeve = [SKAction repeatActionForever:blink];
    [light runAction: blinkForeve];
    return  light;
    
}
@end
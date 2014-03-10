//
//  STKGameController.m
//  Strik
//
//  Created by Matthijn Dijkstra on 10/03/14.
//  Copyright (c) 2014 Strik. All rights reserved.
//

#import "STKGameController.h"

#import "STKMatchController.h"

#import "NSObject+Observer.h"

@interface STKGameController()

@property STKMatchController *matchController;

@end

@implementation STKGameController

- (void)sceneCreated
{
    // Create a pointer to the matchController to have easier accces
    self.matchController = self.core[@"match"];
    
    // The scene just wants to listen
    [self.scene observeModel:(STKModel *)self.matchController.match];
    
    // Network events
	[self routeNetMessagesOf:BOARD_INIT to:@selector(setupBoard:)];
    [self routeNetMessagesOf:BOARD_UPDATE to:@selector(handleBoardUpdates:)];
    [self routeNetMessagesOf:TILE_SELECTION_EXTENDED to:@selector(handleSelectionExtended:)];
    [self routeNetMessagesOf:TILE_SELECTION_CLEARED to:@selector(handleSelectionCleared:)];
    [self routeNetMessagesOf:WORD_FOUND to:@selector(handleWordFound:)];
}

#pragma mark networking
- (void)setupBoard:(STKIncomingMessage *)message
{
	
}

- (void)handleBoardUpdates:(STKIncomingMessage *)message
{
	
}

- (void)handleSelectionExtended:(STKIncomingMessage *)message
{
	
}

- (void)handleSelectionCleared:(STKIncomingMessage *)message
{
	
}

- (void)handleWordFound:(STKIncomingMessage *)message
{
	
}

#pragma mark user events

@end

//
//  STKLobbyController.h
//  Strik
//
//  Created by Matthijn Dijkstra on 22/02/14.
//  Copyright (c) 2014 Strik. All rights reserved.
//

#import "STKSceneController.h"

#import "GridNodeDelegate.h"

@interface STKLobbyController : STKSceneController <GridNodeDelegate>

// This will be called when the challenge is revoked by the local player and the overlay is hidden
- (void)revokeChallenge;

// Will be called when the friend declined the challenge
- (void)friendDeclinedChallenge;

@end

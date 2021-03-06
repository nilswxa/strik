//
//  STKOutgoing.h
//  Strik
//
//  Created by Nils on Aug 1, 2013.
//  Copyright (c) 2013 Indev. All rights reserved.
//

typedef NS_ENUM(int8_t, STKOutgoingOpcode)
{
	CLIENT_CRYPTO,
	CREATE_PLAYER,
	LOGIN,
	CHANGE_NAME,
	CHANGE_AVATAR,
	CHANGE_LOCALE,
	DELETE_PLAYER,
	REQUEST_MATCH,
	CHALLENGE_PLAYER,
	ACCEPT_CHALLENGE,
	DECLINE_CHALLENGE,
	REVOKE_CHALLENGE,
	EXIT_MATCH,
	PLAYER_READY,
	SELECT_TILES,
	PURCHASE_OFFER,
	ACTIVATE_ITEM,
	FACEBOOK_LINK,
	FACEBOOK_UNLINK,
	FACEBOOK_INIT_FRIENDLIST,
	FACEBOOK_REFRESH_FRIENDS,
	FACEBOOK_CLAIM_LIKE,
	FACEBOOK_REGISTER_INVITES,
	GET_ACTIVITY_STREAM,
	GET_SHOP_PAGE,
	GET_IN_APP_PURCHASE_PRODUCTS,
	REDEEM_IN_APP_PURCHASE,
	GET_NEWS
};


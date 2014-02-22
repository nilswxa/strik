//
//  STKAvatarNode.m
//  Strik
//
//  Created by Matthijn Dijkstra on 21/02/14.
//  Copyright (c) 2014 Strik. All rights reserved.
//

#import "STKAvatarNode.h"

typedef NS_ENUM(NSInteger, zIndex)
{
	Z_BACKGROUND,
	Z_IMAGE,
	Z_BORDER,
};

@interface STKAvatarNode()

// The circle which makes up the outer border
@property (nonatomic)  CCDrawNode *outerCircle;

// The background
@property (nonatomic) CCDrawNode *backgroundCircle;

// The radius of the border circle
@property (readonly) CGFloat radius;

// The clipping node which will clip the image
@property CCClippingNode *clippingNode;

@end

@implementation STKAvatarNode

- (void)setBorderColor:(CCColor *)borderColor
{
	_borderColor = borderColor;
	
	// The outer circle is an white image of a ring, which is tinted, this removes the jagged edges
	if(!borderColor)
	{
		[self.outerCircle removeFromParent];
	}
	else
	{
		if(!self.outerCircle)
		{
			self.outerCircle = [CCSprite spriteWithImageNamed:@"Global/Images/ring-overlay.png"];
			
			// Center it
			self.outerCircle.position = CGPointMake(self.contentSize.width * self.anchorPoint.x,
						self.contentSize.height * self.anchorPoint.y);
			
			self.outerCircle.zOrder = Z_BORDER;
			[self addChild:self.outerCircle];
		}
		
		self.outerCircle.color = borderColor;
	}

}

- (void)setBackgroundColor:(CCColor *)backgroundColor
{
	_backgroundColor = backgroundColor;
	
	// Remove the old circle if there is one
	if(self.backgroundCircle)
	{
		[self.backgroundCircle removeFromParent];
	}
	
	// When nil is passed no border color is drawn
	if(backgroundColor)
	{
		self.backgroundCircle = [self createCircleWithRadius:self.radius andColor:self.backgroundColor];
		self.backgroundCircle.zOrder = Z_BACKGROUND;
	}
}

- (CCDrawNode *)createCircleWithRadius:(CGFloat)radius andColor:(CCColor *)color
{
	// Create a new circle
	CCDrawNode *circle = [CCDrawNode new];
	
	// Draw it
	[circle drawDot:CGPointMake(0, 0) radius:radius color:color];
	
	// Make sure it is centered
	circle.position = CGPointMake(self.contentSize.width * self.anchorPoint.x,
											 self.contentSize.height * self.anchorPoint.y);
	
	// And add to the tree
	[self addChild:circle];
	
	return circle;
}

- (void)setMaskedImage:(CCSprite *)maskedImage
{
	// Delete old if there is one
	if(self.maskedImage)
	{
		[self.clippingNode removeFromParent];
	}
	
	_maskedImage = maskedImage;
		
	// When a masked image is set the background is removed
	[self.backgroundCircle removeFromParent];

	// Only set new if there is one
	if(maskedImage)
	{
		// Create the clipping node
		self.clippingNode = [CCClippingNode clippingNodeWithStencil:[CCSprite spriteWithImageNamed:@"Global/Images/circle-mask.png"]];
		
		// Add the image
		[self.clippingNode addChild:self.maskedImage];
		self.clippingNode.zOrder = Z_IMAGE;
		
		// Don't know what idiot thought defaulting this to one was a good idea
		self.clippingNode.alphaThreshold = 0;
		
		self.clippingNode.position = CGPointMake(self.contentSize.width * self.anchorPoint.x,
												self.contentSize.height * self.anchorPoint.y);
		
		// And add the clipping node to the tree
		[self addChild:self.clippingNode];
	}
}

- (CGFloat)radius
{
	// Substract 2px from the size so it wil be not cut of with aliassing
	return (self.contentSize.width / 2) - 2;
}

@end
